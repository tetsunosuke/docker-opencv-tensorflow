# docker-opencv-tensorflow

opencv(3.4.2), tensorflow(現時点で1.14.0) の環境を手早く作成します。

```
>>> import tensorflow
>>> import cv2
>>> tensorflow.__version__
'1.14.0'
>>> cv2.__version__
'3.4.2'
```

# ビルドと起動・接続

```
$ docker build  -t opencv-tensorflow:1.0 -f Dockerfile .
$ docker run --rm -v `pwd`:/data -it opencv-tensorflow:1.0 /bin/bash
```
