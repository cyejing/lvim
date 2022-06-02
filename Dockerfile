FROM jing23501/lunarvim:latest

RUN cd ~/.config && mv lvim livm.old && mkdir lvim

COPY ./ /root/.config/lvim/

CMD ["bash"]

