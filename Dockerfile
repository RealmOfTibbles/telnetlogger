FROM ubuntu:18.04
RUN apt-get update
RUN apt-get install build-essential -y

Run mkdir -p /opt/logs
Run mkdir -p /opt/code

COPY telnetlogger.c /opt/code/telnetlogger.c
COPY Makefile /opt/code/Makefile
RUN gcc -o /opt/code/telnetlogger /opt/code/telnetlogger.c -Wall -lpthread

Expose 21

ENTRYPOINT ["bash"]
CMD ["-c","/opt/code/telnetlogger -l 21 -p /opt/logs/Credentials.txt -i /opt/logs/Ips.txt"]