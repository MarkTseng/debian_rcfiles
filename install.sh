#!/bin/bash
sudo dpkg-reconfigure dash 
sudo apt-get install debian-builder ctags cscope curl colordiff screen ncftp subversion git tig m4 bison g++ libz-dev flex libncurses5-dev gperf iperf gawk autoconf texinfo libfreetype6-dev dos2unix build-essential vim libstring-crc32-perl ccache libfreetype6 tcl8.5 unzip pkg-config git-core gnupg zip zlib1g-dev libc6-dev x11proto-core-dev libx11-dev python-markdown libxml2-utils tofrodos mingw32 g++-multilib libgl1-mesa-dev lzma htop mr luarocks lua5.1 liblua5.1-0-dev git-svn spawn-fcgi libfcgi-dev libmysqlclient-dev samba cgdb apt-file python-setuptools python-fontforge

# set samba 
sudo smbpasswd -a mark

# install NFS
sudo apt-get install nfs-common nfs-kernel-server portmap
sudo chmod 777 /etc/exports
sudo echo "/home/mark   192.168.135.0/24(rw,sync,no_root_squash,no_subtree_check)" >>  /etc/exports
sudo chmod 644 /etc/exports

# remove rcfile
rm -rf $HOME/.bashrc

# link rcfile
ln -s $HOME/debian_rcfiles/rcfile/bashrc $HOME/.bashrc
ln -s $HOME/debian_rcfiles/rcfile/gdbinit $HOME/.gdbinit
ln -s $HOME/debian_rcfiles/rcfile/screenrc $HOME/.screenrc
ln -s $HOME/debian_rcfiles/rcfile/vimrc $HOME/.vimrc
ln -s $HOME/debian_rcfiles/mr/mrtrust $HOME/.mrtrust

# link nike mrconfig
mkdir $HOME/RTK_workshop
mkdir $HOME/RTK_workshop/nike
mkdir $HOME/RTK_workshop/nike/svn
mkdir $HOME/RTK_workshop/nike/git
ln -s /home/mark/debian_rcfiles/mr/nike_svn_mrconfig $HOME/RTK_workshop/nike/svn/.mrconfig
ln -s /home/mark/debian_rcfiles/mr/nike_git_mrconfig $HOME/RTK_workshop/nike/git/.mrconfig

# install vimplugin
tar xfz vimplugin.tgz -C $HOME

# git ignore
ln -s $HOME/debian_rcfiles/rcfile/global_ignore $HOME/.global_ignore
ln -s $HOME/debian_rcfiles/rcfile/gitconfig $HOME/.gitconfig
git config --global core.excludesfile $HOME/.global_ignore
git config --global color.ui auto

# cgdb
mkdir $HOME/.cgdb
ln -s $HOME/debian_rcfiles/rcfile/cgdbrc $HOME/.cgdb/cgdbrc

# xterm-256color 
mkdir -p $HOME/.terminfo/x/ 
ln -s $HOME/debian_rcfiles/rcfile/xterm-256color $HOME/.terminfo/x/xterm-256color

# powerlin install
cd $HOME/debian_rcfiles/powerlin
./setup.py build
sudo ./setup.py install

# powerlin shell install
cd $HOME/debian_rcfiles/powerlin-shell
./install.py
ln -s $HOME/debian_rcfiles/powerlin-shell/powerline-shell.py ~/powerline-shell.py

