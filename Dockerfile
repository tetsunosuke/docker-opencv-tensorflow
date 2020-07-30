# https://casualdevelopers.com/tech-tips/how-to-setup-anaconda-and-tensorflow-with-docker/#MinicondaTensorflowKerasDocker
# docker build  -t opencv-tensorflow:1.1 -f Dockerfile .
# docker run --rm -v `pwd`:/data -p 8888:8888 -it opencv-tensorflow:1.1 /bin/bash

FROM continuumio/miniconda3
ENV DEBCONF_NOWARNINGS yes

RUN apt-get update -y

RUN conda update conda \
  && conda update --all \
  && conda install jupyterlab numpy numexpr pandas matplotlib scipy statsmodels scikit-learn tensorflow keras nodejs  \
  && conda clean --all \
  && conda install -c menpo Pillow opencv

# 必要なら
#RUN apt-get install -y vim

VOLUME /data
RUN jupyter lab --generate-config
COPY jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py
EXPOSE 8888
CMD jupyter lab

