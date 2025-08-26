# Anos Health Manager

A sophisticated SA-MP (San Andreas Multiplayer) Lua script for MonetLoader on Android that provides health management features with anti-detection mechanisms.

## 🚀 Features

- **Instant Health Management**: Quickly manage your character's health status
- **Anti-Detection System**: Built-in protection against server-side detection
- **Randomized Timing**: Prevents pattern recognition by anti-cheat systems
- **Stealth Mode**: Automatically disables when potential detection is detected
- **Dual Command System**: Two simple commands for different health operations

## 🎮 Commands

| Command | Description | Cooldown |
|---------|-------------|----------|
| `/km`   | Instantly sets health to 0 (kill me) | 500-2000ms |
| `/td`   | Restores health to 100 (tambah darah) | 500-2000ms |

## 🔧 Installation

1. Ensure you have **MonetLoader** installed on your Android device
2. Place the `anos_health.lua` file in your `/storage/emulated/0/Android/media/ro.alyn_sampmobile.game/monetloader/` directory
3. Launch GTA SA and connect to your SA-MP server
4. The script will auto-load with confirmation message

## ⚙️ Technical Details

- **Random Delay System**: Each command execution has randomized timing between 500-2000ms
- **Anti-Cheat Bypass**: Intercepts and handles potential anti-cheat messages
- **Memory Safe**: Proper memory management and encoding handling
- **Thread Safety**: Uses coroutine-based execution for safe operations

## 🛡️ Safety Features

- Automatic script disable when anti-cheat messages are detected
- Randomized execution patterns to avoid detection
- Client-side only modifications
- Cooldown system between commands

## ⚠️ Disclaimer

This script is provided for educational purposes only. Use at your own risk. The author is not responsible for any bans or penalties incurred from using this script. Always check server rules before using any modifications.

## 📝 Changelog

### v3.7
- Initial release
- Added anti-detection system
- Implemented randomized timing
- Added server message interception
- Improved safety features

## 👤 Author

discord: **anos.py**
YouTube: **anosini**

---

**Note**: This script works only on Android devices with MonetLoader. Windows/Linux versions are not supported.
