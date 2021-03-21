FROM debian:bullseye-slim

RUN apt-get update

RUN apt-get install -y xterm x11-xserver-utils xfonts-utils fontconfig
RUN apt-get install -y neovim ssh

ADD run.sh /root/run.sh
RUN chmod +x /root/run.sh

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

WORKDIR /root
CMD /root/run.sh
