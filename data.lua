-- Tree sapling item (capsule type for planting)
data:extend({
  {
    type = "capsule",
    name = "tree-sapling",
    icon = "__base__/graphics/icons/tree-01.png",
    icon_size = 64,
    icon_mipmaps = 4,
    subgroup = "raw-material",
    order = "a[tree-sapling]",
    stack_size = 100,
    capsule_action = {
      type = "throw",
      attack_parameters = {
        type = "projectile",
        activation_type = "throw",
        ammo_category = "capsule",
        cooldown = 30,
        projectile_creation_distance = 0.6,
        range = 20,
        ammo_type = {
          category = "capsule",
          target_type = "position",
          action = {
            type = "direct",
            action_delivery = {
              type = "projectile",
              projectile = "tree-sapling-projectile",
              starting_speed = 0.3
            }
          }
        }
      }
    }
  },

  -- Projectile for the tree planting
  {
    type = "projectile",
    name = "tree-sapling-projectile",
    flags = {"not-on-map"},
    acceleration = 0.005,
    action = {
      type = "direct",
      action_delivery = {
        type = "instant",
        target_effects = {
          {
            type = "script",
            effect_id = "plant-tree"
          }
        }
      }
    },
    animation = {
      filename = "__base__/graphics/icons/tree-01.png",
      frame_count = 1,
      width = 64,
      height = 64,
      priority = "high"
    }
  },

  -- Recipe to craft tree saplings
  {
    type = "recipe",
    name = "tree-sapling",
    enabled = true,
    ingredients = {
      {type = "item", name = "wood", amount = 5}
    },
    results = {{type = "item", name = "tree-sapling", amount = 1}}
  }
})
