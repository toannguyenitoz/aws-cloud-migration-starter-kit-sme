<?php
// Simple demo page for cloud migration lab.
// Do not store real credentials in this file.

$db_host = getenv('DB_HOST') ?: 'not-configured';
$db_name = getenv('DB_NAME') ?: 'not-configured';

?>
<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <title>Southern Cross Office Supplies</title>
</head>
<body>
  <h1>Southern Cross Office Supplies</h1>
  <p>Cloud migration demo application.</p>
  <ul>
    <li>Database host: <?php echo htmlspecialchars($db_host); ?></li>
    <li>Database name: <?php echo htmlspecialchars($db_name); ?></li>
  </ul>
  <p><a href="/health.html">Health Check</a></p>
</body>
</html>
