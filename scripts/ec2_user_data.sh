#!/bin/bash
set -euo pipefail

dnf update -y
dnf install -y httpd php php-mysqli mariadb105

cat > /var/www/html/index.html <<'HTML'
<!doctype html>
<html>
<head>
  <title>Southern Cross Office Supplies - Cloud Migration Lab</title>
</head>
<body>
  <h1>Southern Cross Office Supplies</h1>
  <p>Customer portal is running on AWS EC2 behind an Application Load Balancer.</p>
  <p>Status: OK</p>
</body>
</html>
HTML

cat > /var/www/html/health.html <<'HTML'
OK
HTML

systemctl enable httpd
systemctl start httpd
