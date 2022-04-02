<?php
if (!file_exists ('config/db.php')){
		header("location: install/");
		exit;
	}
// checking for minimum PHP version
if (version_compare(PHP_VERSION, '5.3.7', '<')) {
    exit("Sorry, Simple PHP Login does not run on a PHP version smaller than 5.3.7 !");
} else if (version_compare(PHP_VERSION, '5.5.0', '<')) {
    // if you are using PHP 5.3 or PHP 5.4 you have to include the password_api_compatibility_library.php
    // (this library adds the PHP 5.5 password hashing functions to older versions of PHP)
    require_once("libraries/password_compatibility_library.php");
}

// Incluir las configuraciones/constantes para la conexión de la base de datos
require_once("config/db.php");
// Cargar la clase de inicio de sesión
require_once("classes/Login.php");
// crea un objeto de inicio de sesión. cuando se crea este objeto, hará todas las cosas de inicio/cierre de sesión automáticamente
// por lo que esta sola línea maneja todo el proceso de inicio de sesión.
$login = new Login();
// Preguntar si hemos iniciado sesión
if ($login->isUserLoggedIn() == true) {
    // El usuario ha iniciado sesión. 
	 header("location: index.php");

?>

<?php 
} else {
	$page_title="Órdenes Y & M | Login";
	 ?>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title><?php echo $page_title;?></title>
  <!-- Revisa que el navegador responda al ancho de la pantalla  -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.5 -->
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.css">
</head>

<body class="hold-transition">
  <div class="container">
    <div class="row father h-100">
      <div class="col-md-8 col-xs-12 text-center">
        <img class="" src="img/Monochromatic.svg" alt="" width="85%">
      </div>
      <div class="col-md-4 col-xs-12">
        <div class="login-box">
          <div class="login-logo">
            <a href="login.php">Órdenes | <b>Y & M</b></a>
            <h4 class="fw-bolder">INICIO DE SESIÓN</h4>
            <p class="fs-sm">Bienvenidos al sistema de órdenes automatizados yant & marc, ingresa para empezar a crear.</p>
          </div><!-- /.login-logo -->
          <div class="login-box-body">
            <?php
				// Muestra posibles errores / comentarios (desde el objeto de inicio de sesión)
				if (isset($login)) {
					if ($login->errors) {
						?>
            <div class="alert alert-danger alert-dismissible" role="alert">
              <strong>¡Error!</strong>

              <?php 
						foreach ($login->errors as $error) {
							echo $error;
						}
						?>
            </div>
            <?php
					}
					if ($login->messages) {
						?>
            <div class="alert alert-success alert-dismissible" role="alert">
              <strong>¡Aviso!</strong>
              <?php
						foreach ($login->messages as $message) {
							echo $message;
						}
						?>
            </div>
            <?php 
					}
				}
				?>
            <form action="login.php" method="post">
              <div class="form-group has-feedback d-flex p-0 m-0">
                <input type="text" name="user_name" class="form-control border-0 rounded-top p-4"
                  placeholder="Correo electrónico" required>
                <span class="glyphicon glyphicon-envelope icon-center form-control-feedback"></span>
              </div>
              <div class="form-group has-feedback d-flex">
                <input type="password" name="user_password" class="form-control border-0 rounded-bottom p-4"
                  placeholder="Contraseña" required>
                <span class="glyphicon glyphicon-lock icon-center form-control-feedback"></span>
              </div>
              <div class="row">
                <div class="col-xs-8">
                  <div class="checkbox icheck">

                  </div>
                </div><!-- /.col -->
                <div class="col-xs-4 btn-block">
                  <button type="submit" name="login" class="btn btn-block btn-flat btn-rounded bg-buttons">Iniciar sesión</button>
                </div><!-- /.col -->
              </div>
            </form>
          </div><!-- /.login-box-body -->
        </div><!-- /.login-box -->
      </div>
    </div>
  </div>

  <!-- jQuery 2.1.4 -->
  <script src="plugins/jQuery/jQuery-2.1.4.min.js"></script>
  <!-- Bootstrap 3.3.5 -->
  <script src="bootstrap/js/bootstrap.min.js"></script>
</body>

</html>
<?php
}
?>