nagios-nrpe-server: 
  pkg.installed: []
  service.running:
    - enable: True
    - require: 
      - pkg: nagios-nrpe-server
