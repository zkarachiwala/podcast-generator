FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    python3 \
    python3-venv \
    python3-pip \
    git

 # Create a virtual environment
RUN python3 -m venv /app/venv

# Activate the virtual environment and install packages
ENV PATH="/app/venv/bin:$PATH"
RUN pip install pyyaml

# RUN pip3 install pyYAML

COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
