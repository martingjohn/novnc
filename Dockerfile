FROM python:3.10.6-bullseye

ARG NOVNC_TAG=v1.3.0
ARG WEBSOCKIFY_TAG=v0.10.0
    
ENV VNC_SERVER "localhost:5900"
ENV NOVNC_PORT 6080

RUN pip install --upgrade pip && \
    pip install --no-cache-dir numpy && \
    git config --global advice.detachedHead false && \
    git clone https://github.com/novnc/noVNC --branch $NOVNC_TAG /root/noVNC && \
    git clone https://github.com/novnc/websockify --branch $WEBSOCKIFY_TAG /root/noVNC/utils/websockify

RUN ln -s /root/noVNC/vnc.html /root/noVNC/index.html

ENTRYPOINT [ "bash", "-c", "/root/noVNC/utils/novnc_proxy --vnc ${VNC_SERVER} --listen 0.0.0.0:${NOVNC_PORT}" ]
