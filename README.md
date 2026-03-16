<img width="1024" height="1024" alt="image" src="https://github.com/user-attachments/assets/e758bb50-8a31-4c90-acbe-c3c7923ef5b5" />


# 🦎 LizardSTB (Save This Bar)

Tiny QoL addon for **World of Warcraft**.

Save an action bar once and automatically share it across all characters.

Perfect for utility bars like **mounts, hearthstones, professions, and macros**.

---

## ✨ What It Does

- 💾 Save any action bar
- 🔄 Automatically restores on login
- 👥 Shared across all characters
- 🎮 Works with Bartender4
- 🪶 Lightweight (~150 lines)

---

## 🕹️ Usage

Save a bar:

```
/lstb save <bar number>
```

Example:

```
/lstb save 7
```

This saves **Bar 7** and restores it automatically on all characters.

Optional manual load:

```
/lstb load <bar number>
```

Other commands:

```
/lstb clear <bar>   → remove saved bar template
/lstb list          → show which bars are saved
```

---

## 📊 Bar Reference

WoW internally stores bars as **slots**.

| Bar | Slots |
|-----|------|
| 1 | 1–12 |
| 2 | 13–24 |
| 3 | 25–36 |
| 4 | 37–48 |
| 5 | 49–60 |
| 6 | 61–72 |
| 7 | 73–84 |
| 8 | 85–96 |
| 9 | 97–108 |
| 10 | 109–120 |

Example:

```
/lstb save 7
```

Saves **slots 73–84**.

---

## 🔧 Bartender4 Compatibility

LizardSTB works perfectly with **Bartender4**.

Bartender rearranges the default action slots but still uses the same underlying system, so LizardSTB can safely modify them.

**Bartender is recommended but not required.**

---

## 📦 Installation

1. Download the latest release  
2. Extract into: `Interface/AddOns/`  
3. Folder should look like:

```
Interface/AddOns/LizardSTB/
```

4. Restart the game

---

## 👤 Author

**Lizard**

If you find this useful, feel free to drop a ⭐
