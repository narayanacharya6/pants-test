FROM ubuntu:22.04

ARG PYTHON_VERSION=3.11
ARG DEBIAN_FRONTEND=noninteractive

# INSTALL STANDARD STUFF
RUN set -ex && \
    apt update && \
    apt install -y software-properties-common && \
    apt -y install curl

# INSTALL PYTHON + PIP
RUN add-apt-repository -y ppa:deadsnakes/ppa && \
    apt install -y \
        python${PYTHON_VERSION} \
        python${PYTHON_VERSION}-distutils \
        python${PYTHON_VERSION}-venv && \
    python${PYTHON_VERSION} --version && \
    python${PYTHON_VERSION} -m ensurepip && \
    pip${PYTHON_VERSION} --version
    
# INSTALL PANTS
RUN curl --proto '=https' --tlsv1.2 -fsSL https://static.pantsbuild.org/setup/get-pants.sh | bash
ENTRYPOINT ["/root/.local/bin/pants"]