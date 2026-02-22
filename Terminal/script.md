Fedora uses Ptyxis as the terminal, running bash.

To make custom palette files available for selection in the settings, they have to be dropped in
/home/x/.local/share/org.gnome.Ptyxis/palettes

even better is to symlink to the file in this repo
ln -s /shared/Code/dotfiles/Terminal/BotVom.palette /home/x/.local/share/org.gnome.Ptyxis/palettes/BotVom.palette

get that window transparent too
gsettings set org.gnome.Ptyxis.Profile:/org/gnome/Ptyxis/Profiles/$PTYXIS_PROFILE/ opacity .85
