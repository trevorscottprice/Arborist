-- Tree types organized by biome
local tree_types_by_biome = {
  -- Green/temperate trees for grass and normal terrain
  temperate = {
    "tree-01",
    "tree-02",
    "tree-03",
    "tree-04",
    "tree-05",
    "tree-06",
    "tree-07",
    "tree-08",
    "tree-09"
  },
  -- Red trees for volcanic/red desert areas
  desert_red = {
    "tree-02-red",
    "tree-08-red",
    "tree-09-red"
  },
  -- Brown trees for dry/sandy areas
  desert_brown = {
    "tree-06-brown",
    "tree-08-brown",
    "tree-09-brown"
  }
}

-- Function to determine which tree type to use based on tile
local function get_tree_for_tile(tile_name)
  -- Red desert biome
  if tile_name:find("red%-desert") or tile_name:find("volcanic") then
    return tree_types_by_biome.desert_red
  -- Sand/dry biome
  elseif tile_name:find("sand") or tile_name:find("dirt") then
    return tree_types_by_biome.desert_brown
  -- Default to temperate (grass and other tiles)
  else
    return tree_types_by_biome.temperate
  end
end

-- Return a sapling to whoever threw it; spill on the ground if it doesn't fit
local function refund_sapling(event, surface, position)
  local thrower = event.cause_entity or event.source_entity
  local stack = {name = "tree-sapling", count = 1}

  if thrower and thrower.valid then
    if thrower.insert(stack) > 0 then return end
    surface.spill_item_stack{position = thrower.position, stack = stack}
  else
    surface.spill_item_stack{position = position, stack = stack}
  end
end

-- Handler for the tree planting effect
script.on_event(defines.events.on_script_trigger_effect, function(event)
  if event.effect_id == "plant-tree" then
    local surface = game.surfaces[event.surface_index]
    local position = event.target_position
    local tree

    -- Check if the position is valid for placing a tree
    if surface.can_place_entity{name = "tree-01", position = position} then
      -- Detect the tile type at this position
      local tile = surface.get_tile(position.x, position.y)
      local suitable_trees = get_tree_for_tile(tile.name)

      -- Pick a random tree from the suitable trees for this biome
      local tree_name = suitable_trees[math.random(#suitable_trees)]

      -- Create the tree entity
      tree = surface.create_entity{
        name = tree_name,
        position = position,
        force = "neutral"
      }
    end

    if tree then
      -- Visual effect for planting
      surface.create_entity{
        name = "water-splash",
        position = position
      }
    else
      -- If can't place tree, play error sound and give the sapling back
      surface.play_sound{
        path = "utility/cannot_build",
        position = position
      }
      refund_sapling(event, surface, position)
    end
  end
end)
