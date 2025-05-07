#!/bin/bash

dnf update -y
dnf install -y httpd
systemctl start httpd
systemctl enable httpd

cat <<EOF > /var/www/html/index.html
<html>
  <body>
    <h1> ${environment} Instance is running!</h1>
    <p>Public IP of ${environment} instance:</p>
  </body>
</html>
EOF


# $environment = var.env
# public_ip = 