# yolov3 automation for Docker

This project uses a Linux shell script to automate the process of cutting images learned in Yolov3 with Python (Open CV) and saving them in a new directory. In addition, environment settings can be automatically constructed based on Docker.

このプロジェクトはYolov3で学習した画像をPython(Open CV)で切り取り、新しいディレクトリーに保存する作業をLinuxシェルスクリプトで自動化させるものである。また、実行環境もDockerをもとに自動的に構築可能なので細かな環境設定が不要。

# Dependency
Docker

Yolov3  
ubuntu20.04  
python3(Open CV)  
Pip3  

# Setup

## docker install  
Mac→https://hub.docker.com/editions/community/docker-ce-desktop-mac  
Windows→https://hub.docker.com/editions/community/docker-ce-desktop-windows

## docker command
docker images  
docker ps -a

### exit the container
exit

### enter the container again
docker exec -it "conttainer ID" bash

# Usage
### clone Dockerfile
1. $git clone https://github.com/dokoe1900/ImageDetections.git

### Move to ImageDetections directory  
2. $cd ImageDetections

### docker image build
3. $docker build .

### docker container run
4. $docker run “image ID” bash

### Copy the folder containing the photos to the container
5. $docker cp ./“folder name” "container ID":/root/work/darknet

### Run
6. $./test.sh

### Copy the learned folder to the host
7. $docker cp "container ID":/root/work/darknet/"result folder" ./

# License
none

# Authors
dokoe1900

