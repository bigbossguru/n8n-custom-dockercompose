FROM n8nio/n8n:alpine

# Switch to root to install packages
USER root

# Install Python and required build tools
RUN apk add --no-cache \
    python3 \
    py3-pip \
    python3-dev \
    build-base \
    libffi-dev \
    openssl-dev \
    musl-dev \
    pkgconfig \
    g++


# Upgrade pip and create venv
RUN python3 -m venv /opt/venv

# Add venv to path
ENV PATH="/opt/venv/bin:$PATH"

# Install Python packages
RUN pip install --no-cache-dir \
    numpy \
    pandas \
    openpyxl \
    pikepdf \
    PyPDF2

# Switch back to node user
USER node
