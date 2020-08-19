nagios: 
  pkg.installed: []
  service.running:
    - enable: True
    - require: 
      - pkg: nagios
