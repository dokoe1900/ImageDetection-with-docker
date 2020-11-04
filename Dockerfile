FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
	git \
	build-essential \
	wget \
	vim \
	python3.8 \
	python3-pip 


# timezone setting
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y tzdata
ENV TZ=Asia/Tokyo 

# pip3 opencv install
RUN pip3 install --upgrade pip 
RUN pip3 install opencv-python 
RUN apt-get install libgl1-mesa-glx -y
RUN apt-get install libglib2.0-0 -y 

# darknet clone
RUN mkdir /root/work 
WORKDIR /root/work/
RUN git clone https://github.com/pjreddie/darknet
WORKDIR /root/work/darknet
RUN make

# weights install
RUN wget https://pjreddie.com/media/files/yolov3.weights

# test.sh clone
RUN git clone https://github.com/tim0114gap/ImageDetections.git
WORKDIR /root/work/darknet/ImageDetections
RUN mv test.sh ..
WORKDIR /root/work/darknet
RUN chmod 775 ImageDetections
RUN rm -r ImageDetections
RUN chmod 744 test.sh

# image.c add code
WORKDIR /root/work/darknet/src
RUN sed -i -e '292i \            printf("Bounding Box: Left=%d, Top=%d, Right=%d, Bottom=%d", left, top, right, bot);' image.c
RUN sed -i -e '292a \            puts("");' image.c 
WORKDIR /root/work/darknet
RUN make


CMD ["/bin/bash"]
