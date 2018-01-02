zabbix-agent-install:
  pkg.installed:
    - name: zabbix-agent
  file.managed:
    - name: /etc/zabbix_agentd.conf
    - source: salt://init/files/zabbix_agentd.conf
    - template: jinja
    - defaults:
      Server: {{ pillar['zabbix-agent']['Zabbix_Server'] }}
    - require:
      - pkg: zabbix-agent
  service.running:
    - name: zabbix-agent
    - enable: True
    - watch:
      - pkg: zabbix-agent-install
      - file: zabbix-agent-install
