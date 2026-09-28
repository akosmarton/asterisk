FROM fedora:45

RUN dnf install -y --setopt=install_weak_deps=False \
    asterisk \
    asterisk-sounds-core-en-sln16 \
    asterisk-pjsip \
    asterisk-voicemail-plain \   
    asterisk-iax2 \
    ssmtp

RUN mkdir -p /var/lib/asterisk/moh && \
    curl -sSL http://downloads.asterisk.org/pub/telephony/sounds/asterisk-moh-opsound-sln16-current.tar.gz | tar -xz -C /usr/share/asterisk/moh

EXPOSE 5060/udp 4569/udp
VOLUME /var/spool/asterisk /var/log/asterisk /var/lib/asterisk

CMD ["asterisk", "-f"]
