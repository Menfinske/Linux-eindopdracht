nagios-nrpe-server:
  pkg.installed: []
  service.running: 
    - enable: True
    - require: 
      - pkg: nagios-nrpe-server
    - watch: 
      - file: /usr/local/nagios/etc/servers/host.cfg

/usr/local/nagios/etc/servers/host.cfg:
  file.append: 
    - text: | 
        define host {
                use linux-server
                host_name {hostname}
                alias Ubu-series
                address {address}
                max_check_attempts 5
                check_period 24x7
                notification_interval 30
                notification_period 24x7
        }
