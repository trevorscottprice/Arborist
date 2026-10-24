# Arborist

A Factorio mod that allows you to plant and grow trees naturally in the game.

## Description

Plant and grow trees! Craft tree saplings from wood and throw them to plant real trees. Perfect for reforestation, pollution reduction, and renewable wood farming. Trees adapt to biomes - green trees on grass, red/brown trees in deserts. Replant your factory's forests!

## Features

- **Plantable Trees**: Craft tree saplings and throw them to plant real trees
- **Biome-Aware Planting**: Trees automatically adapt to the terrain
  - Green trees on grass and temperate terrain
  - Red trees on volcanic and red desert terrain
  - Brown trees on sandy and dry terrain
- **Natural Behavior**: Planted trees behave exactly like natural trees
  - Can be harvested for wood
  - Absorb pollution
  - Can be destroyed by biters
  - Provide natural obstacles and cover
- **Simple Recipe**: 5 wood → 1 tree sapling
- **Capsule-based Planting**: Throw saplings like grenades with a 20-tile range
- **Audio Feedback**: Plays error sound when planting in invalid locations
- **Sapling Refund**: If a tree can't be planted, the sapling is returned to your inventory (or dropped at your feet if it's full)

## Installation

### From Factorio Mod Portal
1. Open Factorio
2. Go to Mods → Browse Mods
3. Search for "Arborist"
4. Click Install

### Manual Installation
1. Download the latest release from the [Factorio Mod Portal](https://mods.factorio.com/) or [GitHub Releases](https://github.com/trevorscottprice/Arborist/releases)
2. Place the zip file in your Factorio mods folder:
   - **Windows**: `%APPDATA%\Factorio\mods\`
   - **Linux**: `~/.factorio/mods/`
   - **Mac**: `~/Library/Application Support/factorio/mods/`
3. Launch Factorio and enable the mod

## How to Use

1. Craft **Tree Sapling** from 5 wood (recipe unlocked from start)
2. Equip the sapling in your hand (it works like a capsule/grenade)
3. Throw it on the ground where you want to plant a tree
4. Watch as a tree grows instantly!

## Crafting Recipe

```
5x Wood → 1x Tree Sapling
```

## Localization

Arborist is fully localized in the following languages:
- English
- German (Deutsch)
- French (Français)
- Spanish (Español)
- Russian (Русский)
- Chinese Simplified (简体中文)
- Japanese (日本語)
- Polish (Polski)
- Brazilian Portuguese (Português Brasileiro)

## Technical Details

### Requirements
- Factorio version 2.1 or higher
- Base game mod

### Biome Detection Logic
The mod detects tile types and selects appropriate trees:
- **Temperate biome**: tree-01 through tree-09
- **Desert/Red biome**: tree-02-red, tree-08-red, tree-09-red
- **Desert/Brown biome**: tree-06-brown, tree-08-brown, tree-09-brown

### Files Structure
```
Arborist/
├── info.json           # Mod metadata
├── data.lua            # Item, recipe, and projectile definitions
├── control.lua         # Runtime tree planting logic
├── thumbnail.png       # Mod icon
└── locale/             # Translations
    ├── en/
    ├── de/
    ├── fr/
    ├── es-ES/
    ├── ru/
    ├── zh-CN/
    ├── ja/
    ├── pl/
    └── pt-BR/
```

## Contributing

Contributions are welcome! Feel free to:
- Report bugs via [GitHub Issues](https://github.com/trevorscottprice/Arborist/issues)
- Submit pull requests for improvements
- Suggest new features
- Help with translations

## License

MIT License - See LICENSE file for details

## Credits

Created by Trevor Scott Price

## Links

- **GitHub Repository**: https://github.com/trevorscottprice/Arborist
- **Factorio Mod Portal**: https://mods.factorio.com/mod/Arborist

## Changelog

### Version 1.1.0
- Updated for Factorio 2.1
- Saplings are refunded when a tree can't be planted

### Version 1.0.0
- Initial release
- Tree planting via throwable saplings
- Biome-aware tree selection
- Full localization support for 9 languages
- Audio feedback for planting errors
