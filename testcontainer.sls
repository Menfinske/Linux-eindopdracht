docker.io:
  pkg.installed: []
  require:
    - pkgrepo: docker_prerequisites
    - pkg: docker_prerequisites
  service.running:
    - name: docker
    - enable: True
    - restart: True
