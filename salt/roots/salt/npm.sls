default_site_dependencies:
  pkg.installed:
    - name: npm

install_npm_gulp:
  cmd.run:
    - name: npm install -g gulp
  
install_npm_bower:
  cmd.run:
    - name: npm install -g bower
