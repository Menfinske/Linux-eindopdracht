rsyslog: 
  pkg.installed: []
  service.running:
    - require:
      - pkg: rsyslog
