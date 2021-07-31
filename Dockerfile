FROM kalilinux/kali-rolling
EXPOSE 8080
RUN apt update -y  && \
    apt install curl -y  && \
    apt install unrar -y  && \
    apt install unzip -y  && \
    curl -O https://downloads.rclone.org/rclone-current-linux-amd64.zip && \
    unzip rclone-current-linux-amd64.zip && \
    cp /rclone-*-linux-amd64/rclone /usr/bin/ && \
    chown root:root /usr/bin/rclone && \
    chmod 755 /usr/bin/rclone && \
    apt install aria2 -y && \
    apt install wget -y && \
    apt-get install procps -y
RUN echo "$ENTRYPOINT_IN_URL"
RUN curl "https://gist.githubusercontent.com/pingme998/3a61ce379bf24cf50e58a9040eec2be4/raw/fdb224602e7fe8998029156404a47c6a662c7f82/entrypointvaa.sh" >/entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh
