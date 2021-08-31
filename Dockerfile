# Copyright (c) 2021 Wind River Systems, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM ubuntu:focal

env USER root

RUN : \
    && apt-get update -qq \
    && apt install software-properties-common -y \
    && add-apt-repository ppa:deadsnakes/ppa -y \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install \
       -qq -y --no-install-recommends \
       build-essential \
       python2.7 \
       python2.7-dev \
       python3-dev \
       python3.6 \
       python3.9 \
       python3.6-dev \
       python3.9-dev \
       python3-pip \
       libffi-dev \
       libxml2-dev \
       libxslt1-dev \
       vim \
       git-core \
       libpq-dev \
       libsasl2-dev \
       libldap2-dev \
       postgresql-common \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && pip install -U pip tox flake8
