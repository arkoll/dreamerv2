FROM tensorflow/tensorflow:2.11.0-gpu

# System packages.
RUN apt-get update && apt-get install -y \
  ffmpeg \
  libgl1-mesa-dev \
  nano \
  tmux \
  git \
  && apt-get clean

# Python packages.
RUN pip install --no-cache-dir \
  gym \
  dm_control \
  ruamel.yaml \
  tensorflow_probability \
  wandb

# DreamerV2.
ENV TF_XLA_FLAGS --tf_xla_auto_jit=2
COPY . /app
WORKDIR /app
