# docker-tensor:1.0
# docker run --rm -v `pwd`:/home/tensor-docker -it tensor-docker:1.0 /bin/bash
FROM python:3.6

RUN apt-get update -y && apt-get install -yq make cmake gcc g++ unzip wget build-essential gcc zlib1g-dev vim

# Opencvのインストール
RUN ln -s /usr/include/libv4l1-videodev.h /usr/include/linux/videodev.h
RUN mkdir ~/tmp
#RUN cd ~/tmp && wget https://github.com/Itseez/opencv/archive/3.4.6.zip && unzip 3.4.6.zip
RUN cd ~/tmp && git clone https://github.com/opencv/opencv.git && git clone https://github.com/opencv/opencv_contrib.git


RUN cd ~/tmp/opencv && mkdir build && cd build && cmake -DWITH_TBB=ON \
    -DINSTALL_CREATE_DISTRIB=ON \
    -DWITH_FFMPEG=OFF \
    -DWITH_IPP=OFF \
    -DOPENCV_EXTRA_MODULES_PATH=~/tmp/opencv_contrib/modules \
    -DCMAKE_INSTALL_PREFIX=/usr/local ..
RUN cd ~/tmp/opencv/build && make -j2 && make install

# TensorflowとOpencvのインストール
RUN pip3 install numpy tensorflow opencv-python

ENV APP_NAME tensor-docker
WORKDIR /home/$APP_NAME

CMD [ '/bin/bash'  ]
