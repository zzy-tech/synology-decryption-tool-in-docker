# Dockerized Synology Decryption Tool with VNC Viewer

## Overview
This repository contains a Docker setup for running the Synology Decryption Tool within a Docker container. It is specifically designed for Mac users who cannot directly use the Synology Decryption Tool due to the absence of a macOS version. By using Docker and VNC Viewer, Mac users can easily operate the decryption tool through a graphical user interface.

## Features
- **Dockerized Environment**: Ensures compatibility across different systems, including macOS.
- **VNC Integration**: Provides a graphical user interface accessible via VNC Viewer, making it user-friendly for those who prefer GUI over command-line operations.
- **Ease of Use**: Simplifies the process of setting up and using the Synology Decryption Tool on macOS.

## Prerequisites
Before you begin, ensure you have the following installed on your machine:
- [Docker Desktop for Mac](https://www.docker.com/products/docker-desktop)
- [VNC Viewer](https://www.realvnc.com/en/connect/download/viewer/)

## Installation
1. **Clone the Repository**
   ```bash
   git clone https://github.com/zzydy/synology-decryption-tool-in-docker.git
   cd docker-synology-decrypt
   ```

2. **Build the Docker Image**
   ```bash
   docker build -t synology-decrypt .
   ```

3. **Run the Docker Container**
   Start the Docker container by mounting your local directory where the decryption files are stored. Replace `/path/to/your/local/directory` with the actual path to your directory.
   ```bash
   docker run --name synology-decrypt -it -p 5900:5900 --mount type=bind,source=/path/to/your/local/directory,target=/mnt synology-decrypt
   ```


## Accessing the Tool
To access the Synology Decryption Tool:
1. Open VNC Viewer.
2. Connect to `localhost:5900`.
3. Enter the password you set in the Dockerfile.

## Usage
Once connected via VNC Viewer, you can use the Synology Decryption Tool as you would on a native system. The GUI will guide you through the process of selecting files for decryption and setting the destination for the decrypted files.

## Contributing
Contributions to improve the setup or documentation are welcome. Please feel free to fork the repository and submit pull requests, or open issues for bugs and feature requests.

## License
This project is open source and available under the [MIT License](LICENSE).
