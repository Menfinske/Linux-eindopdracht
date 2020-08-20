nagios-nrpe-server:
  pkg.installed: []
  service.running: 
    - enable: True
    - require: 
      - pkg: nagios-nrpe-server
    - watch: 
      - file: /usr/local/nagios/etc/servers/host.cfg
      - file: /etc/nagios/nrpe.cfg

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
/etc/nagios/nrpe.cfg: 
  file.replace: 
    - pattern: ',::1'
    - repl: ',10.0.7.97'
