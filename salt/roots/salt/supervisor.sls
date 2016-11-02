install_supervisor:
  pkg.installed:
    - name: supervisor

setup_supervisor_service:
  service.running:
    - name: supervisor
    - enable: true
