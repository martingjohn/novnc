# Standalone NoVNC Container

This image is intended to run a small standalone server that can target either other machines on the same network or other Docker containers.

## Configuration

Two environment variables exist in the docker file for configuration REMOTE_HOST and REMOTE_PORT.

### Variables

**VNC_SERVER** Host and port running a VNC Server to connect to - defaults to *localhost:5900*
**NOVNC_PORT** Port that the NoVNC Server is listening on - defaults to *6080*

## Usage

```
docker run -d -e VNC_SERVER="192.168.86.135:5901" -e NOVNC_PORT=8081 martinjohn/novnc
```

