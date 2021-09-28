FROM debian:stable-slim
FROM theteamultroid/ultroid:main

# set timezone
ENV TZ=Asia/Kolkata
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# clone the repo and change workdir
RUN git clone -b dev https://github.com/TeamUltroid/Ultroid.git /root/TeamUltroid/
WORKDIR /root/TeamUltroid/

# install main requirements.
COPY . .
RUN pip3 install -r requirements.txt
RUN pip3 uninstall av -y && pip3 install av --no-binary av

# start the bot
CMD ["python3", "-m", "gitsampleX"]
#EXPOSE 3000
