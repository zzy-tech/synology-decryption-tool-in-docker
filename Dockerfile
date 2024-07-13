# Use the latest Ubuntu as the base image
FROM ubuntu:latest

# Set environment variable to prevent interactive prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Update package list and install VNC server, X11, GTK, and other necessary software
RUN apt-get update && apt-get install -y \
    wget \
    tar \
    x11vnc \
    xvfb \
    xterm \
    libglib2.0-0 \
    libgtk-3-0 \
    libgdk-pixbuf2.0-0 \
    libcairo2 \
    libpango-1.0-0 \
    libpangocairo-1.0-0 \
    libgobject-2.0-0 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set VNC password
RUN x11vnc -storepasswd yourpassword /etc/vncsecret
ENV X11VNC_OPTS="-forever -usepw -create"

# Set the working directory
WORKDIR /app

# Download and extract the Synology Cloud Sync Decryption Tool
# Update the download link below when releasing a new version
RUN wget "https://global.synologydownload.com/download/Utility/SynologyCloudSyncDecryptionTool/027/Linux/x86_64/SynologyCloudSyncDecryptionTool-027_x64.tar.gz?model=DS923%2B&bays=4&dsm_version=7.2.1&build_number=69057" -O decryption-tool.tar.gz \
    && tar -xzf decryption-tool.tar.gz \
    && rm decryption-tool.tar.gz

# Ensure the decryption tool is executable
RUN chmod +x /app/SynologyCloudSyncDecryptionTool

# Copy a start script to launch the VNC server and your application
COPY start-vnc.sh /app/start-vnc.sh
RUN chmod +x /app/start-vnc.sh

# Set the command to be executed when the container starts
CMD ["/app/start-vnc.sh"]
