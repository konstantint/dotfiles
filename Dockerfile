FROM ubuntu:20.04

RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install -y git make stow sudo wget software-properties-common locales byobu
RUN locale-gen en_US.UTF-8

WORKDIR /root
COPY . dotfiles
RUN rm .bashrc .profile
# echo '\n' to suppress one 'Press Enter' prompt
RUN echo '\n' | make -C dotfiles install

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV TERM xterm-256color

CMD /bin/byobu
