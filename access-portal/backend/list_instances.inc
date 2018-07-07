<?php
  $query = "select * from cloud_instances where true";
  $param_str = "";
  $params = array();
  if ($_REQUEST['min_cpu'] ?? '') {
    $query .= " and cpu >= ?";
    $param_str .= "d";
    $params[] = $_REQUEST['min_cpu'];
  }
  if ($_REQUEST['min_ram'] ?? '') {
    $query .= " and ram >= ?";
    $param_str .= "d";
    $params[] = $_REQUEST['min_ram'];
  }
  if ($stmt = $mysqli->prepare($query)) {
    if ($params) {
      $stmt->bind_param($param_str, ...$params);
    }
    $stmt->execute();
    $result = $stmt->get_result();
  }
?>

<table>
  <thead>
    <tr>
      <th>Service</th>
      <th>Name</th>
      <th>RAM</th>
      <th>vCPU</th>
    </tr>
  </thead>
  <tbody>
    <?php while ($row = $result->fetch_assoc()) { ?>
      <tr>
        <td><?= $row['service'] ?></td>
        <td><?= $row['name'] ?></td>
        <td><?= $row['ram'] ?></td>
        <td><?= $row['cpu'] ?></td>
      </tr>
    <?php } ?>
  </tbody>
</table>
