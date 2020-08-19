rsyslog: 
  pkg.installed: []
  service.running:
    - enable: True 
    - watch: 
      - file: /etc/rsyslog.conf 
    - require:
      - pkg: rsyslog

/etc/rsyslog.conf: 
  file.append: 
    - text: '*.* @@10.0.7.97:514'
