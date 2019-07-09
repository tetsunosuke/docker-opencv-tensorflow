# https://casualdevelopers.com/tech-tips/how-to-setup-anaconda-and-tensorflow-with-docker/#MinicondaTensorflowKerasDocker
# docker build  -t opencv-tensorflow:1.0 -f Dockerfile .
# docker run --rm -v `pwd`:/data -it opencv-tensorflow:1.0 /bin/bash

FROM continuumio/miniconda3
ENV DEBCONF_NOWARNINGS yes

RUN apt-get update -y

RUN conda update conda \
  && conda update --all \
  && conda install jupyter numpy numexpr pandas matplotlib scipy statsmodels scikit-learn tensorflow keras  && conda clean --all && conda install -c menpo opencv=3.4.2

# 必要なら
# RUN apt-get install -y vim
# VOLUME /data
# EXPOSE 8888
# CMD jupyter notebook --notebook-dir=/data/notebooks --ip=0.0.0.0 --port=8888 --no-browser --allow-root
