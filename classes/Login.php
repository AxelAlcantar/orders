<?php

/**
 * Clase login
 * Maneja el proceso de inicio y cierre de sesión del usuario
 */
class Login
{
    /**
     * @var object La conexión de la base de datos
     */
    private $db_connection = null;
    /**
     * @var array Recopilación de mensajes de error
     */
    public $errors = array();
    /**
     * @var array Colección de mensajes de éxito
     */
    public $messages = array();

    /**
    * la función "__construct()" se inicia automáticamente cada vez que se crea un objeto de esta clase,
    * cuando lo haces "$login = new Login();"
     */
    public function __construct()
    {
        // Sesión de creación / lectura
        session_start();

    // Comprobar las posibles acciones de inicio de sesión:
    // si el usuario intentó cerrar sesión (sucede cuando el usuario hace clic en el botón de cerrar sesión)
        if (isset($_GET["logout"])) {
            $this->doLogout();
        }
        // iniciar sesión a través de datos de publicación (si el usuario acaba de enviar un formulario de inicio de sesión)
        elseif (isset($_POST["login"])) {
            $this->dologinWithPostData();
        }
    }

    /**
     * Iniciar sesión con los datos de la publicación
     */
    private function dologinWithPostData()
    {
        // Comprobar el contenido del formulario de inicio de sesión
        if (empty($_POST['user_name'])) {
            $this->errors[] = "Username field was empty.";
        } elseif (empty($_POST['user_password'])) {
            $this->errors[] = "Password field was empty.";
        } elseif (!empty($_POST['user_name']) && !empty($_POST['user_password'])) {

            // Se crear una conexión de base de datos, usando las constantes de config/db.php (que se cargaron en index.php)
            $this->db_connection = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);

            // Cambiar el conjunto de caracteres a utf8 y comprobarlo
            if (!$this->db_connection->set_charset("utf8")) {
                $this->errors[] = $this->db_connection->error;
            }

            // Si no hay errores de conexión 
            if (!$this->db_connection->connect_errno) {

                // Escapar de las cosas POST
                $user_name = $this->db_connection->real_escape_string($_POST['user_name']);

                // Consulta de la base de datos, obteniendo toda la información del usuario seleccionado (permite iniciar sesión 
                // a través de la dirección de correo electrónico en el
                // campo de nombre de usuario)
                $sql = "SELECT 	user_id, fullname, user_name, user_email, user_password_hash
                        FROM users
                        WHERE user_name = '" . $user_name . "' OR user_email = '" . $user_name . "';";
                $result_of_login_check = $this->db_connection->query($sql);

                // Si este usuario existe
                if ($result_of_login_check->num_rows == 1) {

                    // Obtiene la fila de resultados (como un objeto)
                    $result_row = $result_of_login_check->fetch_object();

                // usando la función password_verify() para comprobar si la contraseña proporcionada encaja
                // el hash de la contraseña de ese usuario
                    if (password_verify($_POST['user_password'], $result_row->user_password_hash)) {

                        // Escribir datos de usuario en PHP SESSION (un archivo en el servidor)
                        $nombres = $result_row->fullname;
						$_SESSION['name_session']="ispcontrol_admin";
						$_SESSION['full_name'] = $nombres;
						$_SESSION['user_name'] = $result_row->user_name;
                        $_SESSION['user_email'] = $result_row->user_email;
                        $_SESSION['user_login_status'] = 1;
						$_SESSION['user_id']=$result_row->user_id;

                    } else {
                        $this->errors[] = "Usuario y/o contraseña no coinciden.";
                    }
                } else {
                    $this->errors[] = "Usuario y/o contraseña no coinciden.";
                }
            } else {
                $this->errors[] = "Problema de conexión de base de datos.";
            }
        }
    }

    /**
     * Realizar el cierre de sesión
     */
    public function doLogout()
    {
        // Eliminar la sesión del usuario
        $_SESSION = array();
        session_destroy();
        // Devolver un pequeño mensaje de retroalimentación
        $this->messages[] = "Has sido desconectado.";

    }

    /**
     * Devuelva el estado actual del inicio de sesión del usuario
     * @return boolean Estado de inicio de sesión del usuario
     */
    public function isUserLoggedIn()
    {
        if (isset($_SESSION['user_login_status']) AND $_SESSION['user_login_status'] == 1) {
            return true;
        }
        // return
        return false;
    }
}
