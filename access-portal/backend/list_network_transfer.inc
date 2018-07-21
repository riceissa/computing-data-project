<?php
  $query = "select * from network_transfer where true";
  $param_str = "";
  $params = array();
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

<h1>Network</h1>

<pre>This is some temporary documentation to help with developing and testing
the site. The parameters you can use in the URL:

* provider_filter - filter the provider name using a regex
</pre>

<table>
  <thead>
    <tr>
      <th>Provider</th>
      <th>Date</th>
      <th>Source</th>
      <th>Destination</th>
      <th>Transfer cost (dollars per GB)</th>
    </tr>
  </thead>
  <tbody>
    <?php while ($row = $result->fetch_assoc()) { ?>
      <tr>
        <td><?= $row['provider'] ?></td>
        <td><?= $row['date_observed'] ?></td>
        <td><?= $row['source'] ?></td>
        <td><?= $row['destination'] ?></td>
        <td style="text-align: right;"><?= $row['transfer_cost'] ?></td>
      </tr>
    <?php } ?>
  </tbody>
</table>
