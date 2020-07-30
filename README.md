# docker-opencv-tensorflow

OpenCVやJupyterLabを含めた機械学習系のあれこれを詰め込んだ環境です。

起動時に JupyterLabが起動します。

ローカル環境でのみ利用を想定しているので、パスワードは `root` で入れる初期設定としています。

# ビルドと起動・接続

```
$ docker build  -t opencv-tensorflow:1.1 -f Dockerfile .

# 起動してシェル接続
$ docker run --rm -v `pwd`:/data -it opencv-tensorflow:1.1 /bin/bash
# 起動してJupyter Labで利用
$ docker run --rm -v `pwd`:/data -it opencv-tensorflow:1.1 
```
