FROM fedora:40

RUN dnf install -y \
    asterisk \
    asterisk-sounds-core-en-alaw \
    asterisk-sounds-core-en-gsm \
    asterisk-sounds-core-en-ulaw \
    asterisk-sounds-core-en-g722 \
    asterisk-pjsip \
    asterisk-voicemail-plain \   
    ssmtp

EXPOSE 5060/udp 5060/tcp
VOLUME /var/spool/asterisk /var/log/asterisk

USER asterisk

CMD ["asterisk", "-f"]
