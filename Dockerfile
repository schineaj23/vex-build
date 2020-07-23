FROM ubuntu:18.04

RUN apt-get update

# Install GCC & Clang
RUN apt-get install build-essential -y
RUN apt-get install wget -y
RUN bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"

# Install needed ARM deps
RUN apt-get install gcc-arm-none-eabi -y
RUN apt-get install binutils-arm-none-eabi -y

# Install 7z & cURL
RUN apt-get install p7zip-full -y
RUN apt-get install curl -y

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]