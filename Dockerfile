FROM ubuntu:22.04

WORKDIR /workspace

RUN apt update && apt install -y bison clang cmake git \
    flex

RUN git clone https://github.com/never-lang/never.git

WORKDIR /workspace/never/build

RUN cmake ..

RUN make

RUN ln -s $PWD/never /bin/never

WORKDIR /code

COPY bin .

CMD "./run.sh"