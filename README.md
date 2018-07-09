# Bubble Menu

This package creates a cool customizable menu for atom.

![Image](media/bubblemenu.gif?raw=true)

The menu is hidden by default and can be triggered by hovering on the bottom right corner of your your editor window.

You can customize it with preferred colors, commands and icons.

![Image](media/colorss.png?raw=true)

## Installation

The easiest way to install bubble-menu is to do as follows:

- Go to Atom > Settings
- Click "+ Install"
- Search for `bubble-menu` and click `packages` button to search.
- Browse for `bubble-menu` and click `install`
- Restart atom to activate the package.

Alternatively you can use the [Atom Package Manager](https://github.com/atom/apm):

```bash
apm install bubble-menu
```

---

## Customizing

### adding and editing bubbles.

To add your own bubbles or edit the existing ones,

- Right click on your editor
- Look for `bubble-menu-config` and click it.
- edit the displayed file [`bubble-menu.cson`] following the existing style. i.e
  ![Image](media/config.png?raw=true)
  - Enter a new entry as shown below.
  - The new entry should entered before the close of the square bracket `]` ( example after line `26` in the above image) .
  - After editing, you'll have to restart atom for the changes to take effect.

```
{
  command: "your command"
  icon: "selected icon"
  text: "text to be displayed beside the icon"
}
```

**PS**:

- Select icons only from the available ones included [here](https://dann254.github.io/bubble-menu-icons).
- You can find commands available on your editor using `command - shift - P` or `ctrl - shift - P` if you are on windows.</br>
  Hovering on the commands displayed on the modal, shows the precise text you can use on `bubble-menu`.
  ![Image](media/commands.png?raw=true)
- bubble-menu supports only 15 bubbles. any extra bubbles will not be displayed.
- Any errors in the bubble-config might cause the bubble to be displayed in a weird manner or cause the package to fail. Good for you, Atom will notify you of this 😆.
- You can reorder the bubbles in the config file as per your preference.

### Bubble menu settings.

After installing bubble-menu.

- Go to Atom > settings
- Click `Packages`
- Search for bubble-menu
- click the settings button on the bubble menu card.

![Image](media/settings.png?raw=true)

These settings allow you to customize the look and experience of the bubble-menu.

# Just incase you are wondering 🙂

- **UI theme** : [atom-ice-ui](https://atom.io/themes/atom-ice-ui)
- **Syntax theme** : [atom-ice-syntax](https://atom.io/themes/atom-ice-ui)

---

# Contributing

Anyone is welcome to contribute to the development of this package. It can be a lot of work to keep up on, and I'll take help wherever i can get it :)

## Getting The Code

### 1. Fork

If you're keen to contribute, start by [forking](https://github.com/dann254/bubble-menu#fork-destination-box) the repo and cloning it to your computer.

**Note:** To use the development version, you must first install the production version (`apm uninstall bubble-menu`), then and run the following commands from the root of the bubble-menu project:

```sh
# To install the local version as an Atom Theme
apm link .

# Open with dev mode:
atom --dev .
```

### 2. Make Some Changes

Once this is complete you will be able to edit bubble-menu files directly in Atom and see your UI changes in real time other changes might need you to reload the editor.

### 3. Create a Pull Request

Once you are satisfied, with your updates, commit your change, push them to your fork and submit a pull request with a description of the changes that you made.

### 4. Unlink

Once you're done working locally and ready to install the production version again, simply run `apm unlink .` from the root of the bubble-menu project.

---
