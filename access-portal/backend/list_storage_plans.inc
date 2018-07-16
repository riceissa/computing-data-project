<?php
  $query = "select * from storage_plans where true";
  $param_str = "";
  $params = array();
  if ($_REQUEST['storage_size'] ?? '') {
    // Eventually we might want to do this, but storage_size is a JSON so not
    // easy to filter for in the query
  }
  if ($_REQUEST['provider_filter'] ?? '') {
    $query .= " and provider regexp ?";
    $param_str .= "s";
    $params[] = $_REQUEST['provider_filter'];
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
      <th>Provider</th>
      <th>Name</th>
      <th>Region</th>
      <th>Date</th>
      <th>Storage cost (dollars per month)</th>
      <th>Download cost</th>
      <th>Write op cost (dollars per 1,000 requests)</th>
      <th>Read op cost (dollars per 1,000 requests)</th>
      <th>List op cost (dollars per 1,000 requests)</th>
      <th>Delete op cost (dollars per 1,000 requests)</th>
      <th>Minimum duration (months)</th>
    </tr>
  </thead>
  <tbody>
    <?php while ($row = $result->fetch_assoc()) { ?>
      <tr>
        <td><?= $row['provider'] ?></td>
        <td><?= $row['name'] ?></td>
        <td><?= $row['region'] ?></td>
        <td><?= $row['date_observed'] ?></td>
        <td style="text-align: right;"><?= $row['storage_cost'] ?></td>
        <td style="text-align: right;"><?= $row['download_cost'] ?></td>
        <td style="text-align: right;"><?= $row['write_op_cost'] ?></td>
        <td style="text-align: right;"><?= $row['read_op_cost'] ?></td>
        <td style="text-align: right;"><?= $row['list_op_cost'] ?></td>
        <td style="text-align: right;"><?= $row['delete_op_cost'] ?></td>
        <td style="text-align: right;"><?= $row['minimum_duration'] ?></td>
      </tr>
    <?php } ?>
  </tbody>
</table>
