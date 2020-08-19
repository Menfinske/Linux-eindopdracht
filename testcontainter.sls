docker:
  pkg.installed: 
    - name: docker
  service.running: 
    - name: docker
    - require: 
      - pkg: docker
