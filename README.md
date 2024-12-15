<div align="center">

# ⚈ dotfiles

### 🔷 by fazzi. 🥬 nvidia desktop branch. 🌃 a dynamic hyprland setup!

</div>

<p align="center">
  <img src="assets/showcase.jpg" alt="Rice Showcase">
</p>

- **Distribution:** [arch btw](https://archlinux.org/)
- **Compositor:** [Hyprland](https://github.com/hyprwm/Hyprland)
- **Terminal Emulator:** [foot-transparency](https://codeberg.org/fazzi/foot)
- **Bar and Widgets:** [agsv1](https://github.com/Aylur/ags)
- **App Launcher:** [fuzzel](https://codeberg.org/dnkl/fuzzel/)
- **Notification Daemon:** [dunst](https://github.com/dunst-project/dunst)
- **Shell:** [zsh](https://www.zsh.org/)
- **Shell Plugin Manager:** [zgenom](https://github.com/jandamm/zgenom)
- **Browser:** [LibreWolf](https://librewolf.net/)

## 📁 Installation

Make sure you install GNU Stow and git. To do this on Arch, run
```bash
sudo pacman -S --needed stow git
```
Then, you can clone the repo and cd into it 
```bash
git clone https://gitlab.com/fazzi/dotfiles.git
cd dotfiles
```
And finally, set up the symlinks.
```
stow .
```
If errors arise at this point, this will be because you have existing configs in those locations. Please back these up somewhere else to allow the stow command to complete successfully.

## 🖥️ Wallpapers

Browse through the collection of wallpapers in the [walls repo.](https://gitlab.com/fazzi/walls "walls repo")
