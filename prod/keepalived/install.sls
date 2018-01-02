include:
  - pkg.pkg-init

keepalived-install:
  file.managed:
    - name: /usr/local/src/keepalived-1.2.19.tar.gz
    - source: salt://keepalived/files/keepalived-1.2.19.tar.gz
    - user: root
    - group: root
    - mode: 755
  cmd.run:
    - name: xxxxxxxxxxxxxxx && xxxxxxxxxx && xxxx
    - unless: test -d /usr/local/keepalived
    - require:
      - pkg: pkg-init
      - file: keepalived-install
keepalived-config-dir:
  file.directory:
    - name: /etc/keepalived
    - user: root
    - group: root
    - mode: 755
keepalived-init:
  file.managed:
    - name: /etc/init.d/keepalived
    - source: salt://haproxy/files/keepalived.init
    - user: root
    - group: root
    - mode: 755
    - require:
      - cmd: keepalived-install
  cmd.run:
    - name: chkconfig --add keepalived
    - unless: chkconfig --list | grep keepalived
    - require:
      - file: keepalived-init
