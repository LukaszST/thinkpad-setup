mkdir -p ~/.local/share/fonts

cd /tmp
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraMono.zip
unzip FiraMono.zip -d FiraMonoFont
cp FiraMonoFont/*.ttf ~/.local/share/fonts
rm -rf FiraMono.zip FiraMonoFont

fc-cache
cd -