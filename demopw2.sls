mysql local user:
  mysql_user.present:
    - name: immid00
    - host: localhost
    - allow_passwordless: True
