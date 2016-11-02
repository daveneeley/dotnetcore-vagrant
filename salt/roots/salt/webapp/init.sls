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

manage_program_cs:
  file.managed:
    - name: /home/webapp/Program.cs
    - source: salt://webapp/Program.cs

manage_hosting_json:
  file.managed:
    - name: /home/webapp/hosting.json
    - source: salt://webapp/hosting.json

restore_webapp:
  cmd.run:
    - name: dotnet restore
    - cwd: /home/webapp
    - runas: webapp
    - creates: /home/webapp/project.lock.json

run_webapp:
  cmd.run:
    - name: dotnet run
    - cwd: /home/webapp
    - runas: webapp
