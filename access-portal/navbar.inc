<?php
$menu_items = array(
  '<a href="./index.php">Home</a>',
  'About (forthcoming)',
  '<a href="./storage.php">Storage</a>'
);
?>
<nav>
  <?= implode(", ", $menu_items) ?>
</nav>
