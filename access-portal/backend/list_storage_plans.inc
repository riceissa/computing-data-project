<?php
  $query = "select * from storage_plans where true";
  $param_str = "";
  $params = array();
  if ($_REQUEST['storage_size'] ?? '') {
    $storageUsed = floatval($_REQUEST['storage_size']);
  } else {
    $storageUsed = 0;
  }
  if ($_REQUEST['download_size'] ?? '') {
    $storageDownloaded = floatval($_REQUEST['download_size']);
  } else {
    $storageDownloaded = 0;
  }
  if ($_REQUEST['read_ops'] ?? '') {
    $readOps = floatval($_REQUEST['read_ops']);
  } else {
    $readOps = 0;
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

  function calculateStorageCost($storageUsed, $pricingSchedule) {
    if ($storageUsed <= 0) {
      if (($fv = floatval($pricingSchedule)) > 0) {
        return $fv;
      }
      $pricingExplained = "";
      $prevBound = 0;
      foreach (json_decode($pricingSchedule) as $tier) {
        $bound = $tier[0];
        $rate = $tier[1];
        if ($bound === null) {
          $pricingExplained .= "{$prevBound}+ TB: $rate<br />";
        } else {
          $pricingExplained .= "{$prevBound}–{$bound} TB: $rate<br />";
        }
        $prevBound = $bound;
      }
      return $pricingExplained;
    }
    // If the pricing schedule is just a number, use it to calculate the price
    if (($fv = floatval($pricingSchedule)) > 0) {
      return $storageUsed * $fv;
    }
    // Otherwise, we have a tiered pricing schedule, so use the bounds given to
    // calculate the price
    $total = 0;
    $prevBound = 0;
    $j = json_decode($pricingSchedule);
    foreach ($j as $tier) {
      $bound = $tier[0];
      $rate = $tier[1];
      $used = $bound === null ? $storageUsed - $prevBound : min($bound, $storageUsed) - $prevBound;
      $total += $used * $rate;
      if ($bound === null || $bound > $storageUsed) {
        break;
      }
      $prevBound = $bound;
    }
    return $total;
  }

  function calculateSplitCost($amount, $pricingSchedule,
                                 $expedited = 0, $standard = 0, $bulk = 0) {
    if ($amount <= 0) {
      if (is_numeric($pricingSchedule)) {
        return $pricingSchedule;
      }
      $j = json_decode($pricingSchedule, true);
      return "Expedited: {$j['Expedited']}<br />Standard: {$j['Standard']}<br />Bulk: {$j['Bulk']}";
    }
    if (is_numeric($pricingSchedule)) {
      return $amount * floatval($pricingSchedule);
    }
    // Otherwise, we have a JSON like
    // {"Expedited": 0.03, "Standard": 0.01, "Bulk": 0.0025}
    $j = json_decode($pricingSchedule, true);
    return $expedited * $j["Expedited"] + $standard * $j["Standard"] + $bulk * $j["Bulk"];
  }
?>

<h1>Storage plans</h1>

<pre>This is some temporary documentation to help with developing and testing
the site. The parameters you can use in the URL:

* storage_size - storage size you intend to use in GB
* download_size - the amount of data downloaded/retrieved in GB
* read_ops - number of read-like operations in thousands
* provider_filter - filter the provider name using a regex
</pre>

<table>
  <thead>
    <tr>
      <th>Provider</th>
      <th>Name</th>
      <th>Region</th>
      <th>Date</th>
      <th>Storage cost (dollars<?= $storageUsed <= 0 ? " per GB" : "" ?> per month)</th>
      <th>Download cost (dollars<?= $storageDownloaded <=0 ? " per GB" : "" ?>, excludes transfer cost)</th>
      <th>Write op cost (dollars per 1,000 requests)</th>
      <th>Read op cost (dollars<?= $readOps <= 0 ? " per 1,000 requests" : "" ?>)</th>
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
        <td style="text-align: right;"><?= calculateStorageCost($storageUsed, $row['storage_cost']) ?></td>
        <td style="text-align: right;"><?= calculateSplitCost($storageDownloaded, $row['download_cost'], 0, 0, $storageDownloaded) ?></td>
        <td style="text-align: right;"><?= $row['write_op_cost'] ?></td>
        <td style="text-align: right;"><?= calculateSplitCost($readOps, $row['read_op_cost'], 0, 0, $readOps) ?></td>
        <td style="text-align: right;"><?= $row['list_op_cost'] ?></td>
        <td style="text-align: right;"><?= $row['delete_op_cost'] ?></td>
        <td style="text-align: right;"><?= $row['minimum_duration'] ?></td>
      </tr>
    <?php } ?>
  </tbody>
</table>
