FROM n8nio/n8n

# Switch to root to install packages
USER root

# Install Python and required build tools
RUN apk add --no-cache \
    python3 \
    py3-pip \
    build-base \
    python3-dev \
    libffi-dev \
    openssl-dev \
    musl-dev \
    g++ \
    pkgconfig


# Upgrade pip and create venv
RUN python3 -m venv /opt/venv

# Add venv to path
ENV PATH="/opt/venv/bin:$PATH"

# Install Python packages
RUN pip install --no-cache-dir \
    numpy \
    pandas \
    openpyxl

# Switch back to node user
USER node
