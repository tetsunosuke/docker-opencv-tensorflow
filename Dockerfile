# https://casualdevelopers.com/tech-tips/how-to-setup-anaconda-and-tensorflow-with-docker/#MinicondaTensorflowKerasDocker
# docker run --rm -v `pwd`:/data -it conda:dev /bin/bash

FROM continuumio/miniconda3

RUN apt-get update -y && apt-get install -qy vim

RUN conda update conda \
  && conda update --all \
  && conda install jupyter numpy numexpr pandas matplotlib scipy statsmodels scikit-learn tensorflow keras  && conda clean --all && conda install -c menpo opencv=3.4.2

VOLUME /data

#EXPOSE 8888

#CMD jupyter notebook --notebook-dir=/data/notebooks --ip=0.0.0.0 --port=8888 --no-browser --allow-root
