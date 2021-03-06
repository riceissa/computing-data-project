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
  if ($_REQUEST['provider_filter'] ?? '') {
    $query .= " and provider regexp ?";
    $param_str .= "s";
    $params[] = $_REQUEST['provider_filter'];
  }
  if ($_REQUEST['name_filter'] ?? '') {
    $query .= " and name regexp ?";
    $param_str .= "s";
    $params[] = $_REQUEST['name_filter'];
  }
  if ($stmt = $mysqli->prepare($query)) {
    if ($params) {
      $stmt->bind_param($param_str, ...$params);
    }
    $stmt->execute();
    $result = $stmt->get_result();
  }
?>

<h1>Computing Data Project</h1>

<pre>This is some temporary documentation to help with developing and testing
the site. The parameters you can use in the URL:

* min_cpu - minimum number of vCPUs required
* min_ram - minimum amount of RAM required
* provider_filter - filter the provider name using a regex
* name_filter - filter the instance name using a regex
</pre>

<table>
  <thead>
    <tr>
      <th>Provider</th>
      <th>Name</th>
      <th>Region</th>
      <th>Date</th>
      <th>RAM (GB)</th>
      <th>vCPU</th>
      <th>Processor</th>
      <th>Storage type</th>
      <th>Storage size (GB)</th>
      <th>Cost (dollars per hour)</th>
    </tr>
  </thead>
  <tbody>
    <?php while ($row = $result->fetch_assoc()) { ?>
      <tr>
        <td><?= $row['provider'] ?></td>
        <td><?= $row['name'] ?></td>
        <td><?= $row['region'] ?></td>
        <td><?= $row['date_observed'] ?></td>
        <td style="text-align: right;"><?= $row['ram'] ?></td>
        <td style="text-align: right;"><?= $row['cpu'] ?></td>
        <td><?= $row['processor'] ?></td>
        <td><?= $row['storage_type'] ?></td>
        <td style="text-align: right;"><?= $row['storage_size'] ?></td>
        <td style="text-align: right;"><?= number_format($row['cost'], 4) ?></td>
      </tr>
    <?php } ?>
  </tbody>
</table>
