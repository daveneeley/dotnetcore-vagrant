no_salt_minion_service:
  service.dead:
    - name: salt-minion
    - enable: false
