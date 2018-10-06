FROM ubuntu:latest
MAINTAINER Henrique van Huisstede <henrique@van.huisste.de>

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils \
	wget \
	git \
	curl \
	vim \
	zsh \
	ssh \
	wget \
	build-essential \
	python \
	python-pip \
	debconf-utils \
	sudo \
	openssl \
	dos2unix \
	fontconfig \
	pandoc \
	ca-certificates \
	language-pack-en \
	python-setuptools

RUN git clone https://github.com/powerline/fonts && \
    mv fonts .fonts && \
    cd .fonts && \
    ./install.sh && \
    fc-cache -vf /root/.fonts/ && \
    cd /root/ && \
    mkdir .powerline && \
    cd .powerline && \
    git clone https://github.com/milkbikis/powerline-shell && \
    cd powerline-shell && \
    sudo python setup.py install 

RUN mkdir /root/.ssh && ssh-keyscan -t rsa github.com >> /root/.ssh/known_hosts

WORKDIR /root/



RUN wget --no-check-certificate https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | zsh || true

COPY dotfiles/zshrc.dotfile /root/.zshrc

RUN dos2unix /root/.zshrc



RUN echo "export 'PROMPT=Notehub: ' $PROMPT" >> /root/.zshrc

RUN git clone https://github.com/hennio/vimconfig.git .vim
RUN git clone https://github.com/bhilburn/powerlevel9k.git /root/.oh-my-zsh/custom/themes/powerlevel9k
RUN git clone https://github.com/kien/ctrlp.vim.git /root/.vim/bundle/ctrlp.vim
RUN git clone https://github.com/vim-airline/vim-airline /root/.vim/bundle/vim-airline
RUN git clone https://tpope.io/vim/surround.git /root/.vim/bundle/vim-surround
RUN git clone git://github.com/altercation/vim-colors-solarized.git /root/.vim/bundle/vim-colors-solarized
RUN git clone https://github.com/vim-airline/vim-airline-themes /root/.vim/bundle/vim-airline-themes
RUN git clone https://github.com/easymotion/vim-easymotion /root/.vim/bundle/vim-easymotion
RUN git clone https://github.com/tpope/vim-fugitive.git /root/.vim/bundle/vim-fugitive
RUN git clone https://github.com/junegunn/goyo.vim.git /root/.vim/bundle/goyo.vim

RUN echo "runtime vimrc" > .vimrc
RUN pip install git+git://github.com/Lokaltog/powerline

WORKDIR /root/

entrypoint /bin/zsh

CMD ["zsh"]

