# Locmate 📍

**Locmate** is an all-in-one localization management suite for Dart and Flutter. It bridges the gap between raw translation files and a user-friendly management interface.

## ❤️ Open Source & Community
Locmate is 100% Free and Open Source. It was built by developers, for developers, to make the localization process less painful.

![Locmate Editor](media/editor.png)
![Locmate Add New Key](media/add_new_key.png)
![Locmate Project Settings](media/project_settings.png)

## 🚀 Overview

Locmate is split into two core components:

1.  **Locmate CLI**(packages/locmate): A powerful command-line tool to sync, generate, and manage your `.arb` files.
2.  **Locmate Web**(packages/locmate_web): A local-running web dashboard to visualize, edit, and audit your translations in real-time.

---

## 💻 Locmate CLI

The engine under the hood. The CLI handles the heavy lifting of file manipulation and code generation.

### Installation
Activate Locmate globally from your local path:
```bash
dart pub global activate locmate