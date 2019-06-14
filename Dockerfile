FROM debian:latest
LABEL maintainer="james@faeldon.com"

# Jupyter Port
EXPOSE 8888

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH /workspace/bin:/opt/conda/bin:$PATH

# Java is required by databricks-connect
RUN apt-get update --fix-missing \
 && apt-get install -y wget bzip2 ca-certificates \
    libglib2.0-0 libxext6 libsm6 libxrender1 \
    git openjdk-8-jre

# To update Annaconda go to website and copy download link for
# Linux 64bit distribution and change the link below.
RUN wget --quiet https://repo.anaconda.com/archive/Anaconda3-2019.03-Linux-x86_64.sh -O ~/anaconda.sh \
 && /bin/bash ~/anaconda.sh -b -p /opt/conda \
 && rm ~/anaconda.sh \
 && ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh \
 && echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc \
 && echo "conda activate base" >> ~/.bashrc

# Install jupyter
RUN /opt/conda/bin/conda install jupyter -y

# Install databricks-connect
# https://docs.databricks.com/user-guide/dev-tools/db-connect.html
RUN pip install -U databricks-connect==5.3
COPY .databricks-connect /root/

# Setup tini
RUN apt-get install -y curl grep sed dpkg \
 && TINI_VERSION=`curl https://github.com/krallin/tini/releases/latest | grep -o "/v.*\"" | sed 's:^..\(.*\).$:\1:'` \
 && curl -L "https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini_${TINI_VERSION}.deb" > tini.deb \
 && dpkg -i tini.deb \
 && rm tini.deb \
 && apt-get clean

ENTRYPOINT [ "/usr/bin/tini", "--" ]
CMD [ "jupyter-lab.sh" ]

