# Tools-Configuration

Configs de **zsh + oh-my-zsh**, **fzf** y **yazi** (macOS).

    git clone git@github.com:Felipe8617/Tools-Configuration.git
    cd Tools-Configuration && ./install.sh

`install.sh` instala dependencias (Brewfile), oh-my-zsh y plugins, y crea symlinks:
`~/.zshrc`, `~/.zprofile`, `~/.config/yazi`. Los archivos previos se respaldan como `*.bak.<timestamp>`.

Nota: `zsh/zshrc` contiene rutas propias de la máquina original (Rancher Desktop, awscli@1); ajústalas si no aplican.
