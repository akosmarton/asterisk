FROM fedora:41

RUN dnf install -y --setopt=install_weak_deps=False \
    asterisk \
    asterisk-sounds-core-en-alaw \
    asterisk-sounds-core-en-gsm \
    asterisk-sounds-core-en-ulaw \
    asterisk-sounds-core-en-g722 \
    asterisk-pjsip \
    asterisk-voicemail-plain \   
    asterisk-iax2 \
    ssmtp

EXPOSE 5060/udp 5060/tcp 4569/udp
VOLUME /var/spool/asterisk /var/log/asterisk

USER asterisk

CMD ["asterisk", "-f"]
