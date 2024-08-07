FROM xhofe/alist:latest-ffmpeg

WORKDIR /opt/alist/

ENV PUID=0
ENV PGID=0
ENV UMASK=022
ENV DB_TYPE sqlite3

RUN mkdir /opt/alist/data

EXPOSE 5244

CMD ["./alist", "server"]
