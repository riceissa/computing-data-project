<!DOCTYPE html>
<html lang="en">
  <?php include_once("analytics.inc"); ?>
  <?php include_once("backend/globalVariables/passwordFile.inc"); ?>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
    <meta name="dcterms.date" content="2018-07-07">
    <meta property="og:title" content="Storage plans" />
    <meta property="og:site_name" content="Computing Data Project" />
    <meta property="og:locale" content="en_US" />
    <title>Storage plans - Computing Data Project</title>
    <link rel="stylesheet" href="tablesorter.css">
    <script src="jquery.min.js"></script>
    <script src="jquery.tablesorter.js"></script>
    <script src="anchor.min.js"></script>
    <?php include_once("style.inc"); ?>
  </head>
  <body>
    <?php include_once("navbar.inc"); ?>
    <?php include("backend/list_storage_plans.inc"); ?>
    <script>
        $(function(){$("table").tablesorter();});
        anchors.add();
    </script>
  </body>
</html>
