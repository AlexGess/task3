FROM debian

RUN apt-get update && apt-get upgrade -y \
    && apt-get install gcc gdb yasm -y

COPY my_strtok_r.asm /tasks/
COPY main.cpp /tasks/
