<?php
$menu_items = array(
  '<a href="./index.php">Home</a>',
  'About (forthcoming)',
  '<a href="./storage.php">Storage</a>',
  '<a href="./network.php">Network</a>'
);
?>
<nav>
  <?= implode(", ", $menu_items) ?>
</nav>
