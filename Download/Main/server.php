<?php
header('Content-Type: application/json');

$data = json_decode(file_get_contents('php://input'), true);

if (isset($data['command'])) {
    $command = $data['command'];
    
    if ($command == 'enable_esp') {
        echo json_encode(["status" => "ESP enabled"]);
    } elseif ($command == 'increase_speed') {
        echo json_encode(["status" => "Speed increased"]);
    } else {
        echo json_encode(["status" => "Unknown command"]);
    }
}
?>
