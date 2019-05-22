FROM ubuntu:latest

Run mkdir -p /opt/logs
Run mkdir -p /opt/code

RUN apt-get update && apt-get install build-essential -y

COPY telnetlogger.c /opt/code/telnetlogger.c
COPY Makefile /opt/code/Makefile
RUN gcc -o /opt/code/telnetlogger /opt/code/telnetlogger.c -Wall -lpthread

Expose 23

ENTRYPOINT ["bash"]
CMD ["-c","/opt/code/telnetlogger -l 23 -p /opt/logs/Credentials.txt -i /opt/logs/Ips.txt"]