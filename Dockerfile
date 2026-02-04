FROM n8nio/n8n

# Switch to root to install packages
USER root

# Install Python and required build tools
# RUN apk add --no-cache \
#     python3 \
#     py3-pip \
#     build-base \
#     python3-dev \
#     libffi-dev \
#     openssl-dev \
#     musl-dev \
#     g++ \
#     pkgconfig

# Install Python and required build tools (Debian)
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    python3-dev \
    build-essential \
    libffi-dev \
    libssl-dev \
    pkg-config \
    g++ \
    && rm -rf /var/lib/apt/lists/*


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
