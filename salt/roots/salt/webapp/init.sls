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
