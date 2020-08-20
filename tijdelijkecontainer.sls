docker.io:
  pkg.installed: []
  require:
    - pkgrepo: docker_prerequisites
    - pkg: docker_prerequisites
  service.running: 
    - parallel: True
    - name: docker
    - enable: True
    - restart: True
    - image: ubuntu
    - port_bindings: 800:80

docker: 
  cmd.run: 
    - name: docker run -d  ubuntu
