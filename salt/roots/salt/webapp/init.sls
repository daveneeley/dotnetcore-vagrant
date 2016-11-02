include: 
  - supervisor
  - dotnetcore
  - npm

make_webapp_user:
  user.present:
    - name: webapp
    - fullname: dotnet webapp
    - home: /home/webapp
    - createhome: True
    - gid_from_name: True

start_new_webapp:
  cmd.run:
    - name: dotnet new -t web
    - cwd: /home/webapp
    - runas: webapp
    - creates: /home/webapp/Program.cs

restore_webapp:
  cmd.run:
    - name: dotnet restore
    - cwd: /home/webapp
    - runas: webapp
    - creates: /home/webapp/project.lock.json

prepare_www:
  file.directory:
    - name: /var/www

clean_published_webapp:
  file.absent:
    - name: /var/www/webapp

publish_webapp:
  cmd.run:
    - name: dotnet publish
    - cwd: /home/webapp
    - runas: webapp
    - creates: /home/webapp/bin/Debug/netcoreapp1.0/publish
  file.rename:
    - name: /var/www/webapp
    - source: /home/webapp/bin/Debug/netcoreapp1.0/publish

webapp_supervisor_conf:
  file.managed:
    - name: /etc/supervisor/conf.d/webapp.conf
    - source: salt://webapp/webapp.supervisor.conf

start_supervisor:
  service.running:
    - name: supervisor
    - restart: True
    - onchanges:
      - file: webapp_supervisor_conf
      - file: publish_webapp
