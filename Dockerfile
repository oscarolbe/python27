FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive

# install python
RUN set -x \
    && apt-get update -qy \
    && apt-get install --no-install-recommends -qfy curl python python-dev python-setuptools build-essential git \
    && apt-get clean

RUN apt-get install ca-certificates gcc libssl-dev libxml2-dev libxslt1-dev libffi-dev -y \
    && curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
    && python get-pip.py

# PYPI repository location
ENV PYPI_URL=https://pypi.python.org/
# PYPI index location
ENV PYPI_INDEX_URL=https://pypi.python.org/simple

ADD requirements.txt .
RUN pip install -r requirements.txt
