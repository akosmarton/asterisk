# FROM fedora:43

# RUN dnf install -y --setopt=install_weak_deps=False \
#     asterisk \
#     asterisk-sounds-core-en-alaw \
#     asterisk-sounds-core-en-gsm \
#     asterisk-sounds-core-en-ulaw \
#     asterisk-sounds-core-en-g722 \
#     asterisk-pjsip \
#     asterisk-voicemail-plain \   
#     asterisk-iax2 \
#     ssmtp

FROM ubuntu:questing

RUN apt-get update && apt-get install -y \
    asterisk \  
    asterisk-core-sounds-en-g722 \
    asterisk-core-sounds-en-wav \
    asterisk-moh-opsound-g722 \
    asterisk-moh-opsound-wav \
    ssmtp

EXPOSE 5060/udp 4569/udp
VOLUME /var/spool/asterisk /var/log/asterisk /var/lib/asterisk

CMD ["asterisk", "-f"]
