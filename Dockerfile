FROM debian:bullseye-slim

RUN apt-get update

RUN apt-get install -y xterm x11-xserver-utils xfonts-utils fontconfig
RUN apt-get install -y neovim ssh

ADD run.sh /bin/run.sh
RUN chmod +x /bin/run.sh

ADD DankMono/OpenType-TT/ /usr/share/fonts/truetype/DankMono/
WORKDIR /usr/share/fonts/truetype

RUN mkfontscale
RUN mkfontdir
RUN fc-cache

ADD config/.Xresources /root/.Xresources
ADD config/nvim/ /etc/xdg/nvim/
ADD config/.bashrc /root/.bashrc

RUN sed -i "s/Comment.*term=bold cterm=NONE/Comment      term=bold cterm=italic/" /usr/share/nvim/runtime/syntax/syncolor.vim
#RUN sed -i "s/PreProc.*term=underline cterm=NONE/Comment      term=underline cterm=bold/" /usr/share/nvim/runtime/syntax/syncolor.vim

RUN chmod 777 /bin/run.sh
RUN useradd -ms /bin/bash mvv
RUN chown -R mvv /root
RUN (echo 'xterm'; echo 'xterm') | passwd root

RUN apt-get install -y git

WORKDIR /root
CMD /bin/run.sh
