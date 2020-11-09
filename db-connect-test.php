<?PHP 
include('includes/dbconnect.inc.php');
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
  <?PHP 
  $query = "SELECT username FROM Customer";

  $stmt = $conn->prepare($query);
  $stmt->execute();
  $result = $stmt->get_result();
  echo ($result->num_rows);

  while ($row = $result->fetch_assoc())
  {
      $arr[] = $row;
  }
  var_dump($arr);
  ?>  
</body>
</html>