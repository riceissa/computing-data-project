<?php
$menu_items = array(
  '<a href="./index.php">Home</a>',
  'About (forthcoming)',
  '<a href="./storage.php">Storage</a>',
  '<a href="./network.php">Network</a>',
  'Change <a href="javascript:;" onclick="change_theme_color()">color</a>'
);
?>
<nav>
  <?= implode(", ", $menu_items) ?>
</nav>
