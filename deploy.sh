#!/bin/bash

change_apt_source() {
	echo todo
}

change_python_source() {
    echo "[global]" |sudo tee -a /etc/pip.conf
    echo "index-url=http://pypi.douban.com/simple" |sudo tee -a /etc/pip.conf
}

install_packages() {
    packages=(
    lrzsz
    git
    curl
    vim
    tmux
    htop
    tree
    nginx
    sqlite
    python3
    python3-pip
    golang
    )
    apt update
    for pkg in ${packages[@]};do
        apt install -y $pkg
    done
}

install_tmux_rc() {
    # git clone tmuxrc
    git clone https://github.com/leenzhu/tmux.d.git ~/.tmux.d
    ln -s ~/.tmux.d/tmux.conf ~/.tmux.conf

    echo run-shell ~/.tmux.d/better-mouse/scroll_copy_mode.tmux >> ~/.tmux.conf
}

install_oh_my_zsh() {
    bash -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    chsh -s /bin/zsh
}

install_vim_rc() {
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    git clone https://github.com/leenzhu/vim.d.git ~/.vim.d
    ln -s ~/.vim.d/vimrc ~/.vimrc
}

#change_python_source
#install_tmux_rc
#install_vim_rc
