wordpress:
  pkg.installed: [] 
  require: 
    - pkg: php
    - pkg: apache2 
  cmd.run:
    - name: touch /etc/apache2/sites-available/wordpress.conf
    - name: a2ensite wordpress
    - name: a2enmod rewrite
    - name: service apache2 reload 
