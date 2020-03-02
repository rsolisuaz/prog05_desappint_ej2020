<!DOCTYPE html>
<html lang="es">
  	<head>
    	<meta charset="UTF-8">
		<title>Script de prueba de configuración PHP</title>
		<style type="text/css">
			table {	text-align: center;
					border-spacing: 0;
				}
			td,th { border: 1px solid black;
				 }
		</style>
	</head>
	<body>
		<h1>Script de prueba de configuracion PHP</h1>
<?php 
$usuario="PONER SU NOMBRE COMPLETO AQUÍ";  // Cambie el valor de esta variable por su nombre completo
echo "<h2>Configuración de $usuario</h2>\n";
$indicesServer = array('PHP_SELF', 
'GATEWAY_INTERFACE', 
'SERVER_ADDR', 
'SERVER_NAME', 
'SERVER_SOFTWARE', 
'SERVER_PROTOCOL', 
'REQUEST_METHOD', 
'REQUEST_TIME',  
'QUERY_STRING', 
'DOCUMENT_ROOT', 
'HTTP_ACCEPT', 
'HTTP_ACCEPT_ENCODING', 
'HTTP_ACCEPT_LANGUAGE', 
'HTTP_CONNECTION', 
'HTTP_HOST', 
'HTTP_USER_AGENT', 
'REMOTE_ADDR', 
'REMOTE_HOST', 
'REMOTE_PORT', 
'SCRIPT_FILENAME', 
'SERVER_ADMIN', 
'SERVER_PORT', 
'SCRIPT_NAME', 
'REQUEST_URI') ; 
$identidad = $_GET["identidad"] ?? 32;
echo "<table>\n" ; 
foreach ($indicesServer as $arg) { 
    if (isset($_SERVER[$arg])) { 
        echo '<tr><td>'.$arg.'</td><td>' . $_SERVER[$arg] . "</td></tr>\n" ; 
    } 
    else { 
        echo '<tr><td>'.$arg."</td><td>-</td></tr>\n" ; 
    }     
} 
echo "</table>\n";
?>
	<h2>Prueba de acceso a MySQL usando MySQLi</h2>
<?php
$conn=NULL;
$result=NULL;
$mensajeerror="";
$contenido="<table>\n<tr><th>Tablas en controlpeliculas</th></tr>\n";
mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
include 'config.php';
try {
	$conn = new mysqli($hostdb,
          $usuariodb,$clavedb,$nombredb,$puertodb);
    $conn->set_charset('utf8');
    $result = $conn->query("SHOW TABLES");
    $numregistros = $result->num_rows;
	for($i=0; $i<$numregistros; $i++) {
			$nombretabla=$result->fetch_row();
			$contenido.="<tr><td>{$nombretabla[0]}</td></tr>\n";
	}
	$contenido.="</table>\n";
	$result->free();
	$conn->close();
}
catch (mysqli_sql_exception $ex) {
    $mensajeerror="Error al comunicarse con MySQL<br>".$ex->getMessage()."<br>";
}
if (strlen($mensajeerror)==0) {
	echo $contenido;
}
else {
	echo "<h2>$mensajeerror</h2>\n";
}
?>

<h2>Prueba de acceso a MySQL usando PDO</h2>
<?php
$dsn="mysql:host=$hostdb;dbname=$nombredb";
$mensajeerror="";
$pdo=NULL;
$contenido="<table>\n<tr><th>Usuarios con id_entidad=$identidad</th></tr>\n";
$pdo = new PDO($dsn, $usuariodb,$clavedb,array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
 try {
	$sql = "SELECT nombre FROM usuario WHERE id_entidad = :identidad";
	$valores = [":identidad" => $identidad];
	$query = $pdo->prepare($sql);
	$result = $query->execute($valores);
	if ($result) {
		while ($registro = $query->fetch(PDO::FETCH_ASSOC)) {
			$contenido.="<tr><td>{$registro['nombre']}</td></tr>\n";
		}
	}
	$contenido.="</table>\n";

} catch (Throwable $ex) {
	 $mensajeerror="Error al comunicarse con MySQL usando PDO<br>".$ex->getMessage()."<br>";
}
if (strlen($mensajeerror)==0) {
	echo $contenido;
}
else {
	echo "<h2>$mensajeerror</h2>\n";
}



//phpinfo();
?>