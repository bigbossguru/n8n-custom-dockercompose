FROM python:3.12-alpine AS python-builder

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

# Install Python packages
RUN /opt/venv/bin/pip install --no-cache-dir \
    numpy \
    pandas \
    openpyxl \
    pikepdf \
    PyPDF2

# ---- final image ----
FROM n8nio/n8n

# Switch to root to install packages
USER root
COPY --from=python-builder /opt/venv /opt/venv

# Add venv to path
ENV PATH="/opt/venv/bin:$PATH"

# Switch back to node user
USER node
