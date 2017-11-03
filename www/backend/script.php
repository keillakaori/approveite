<?php
/** Faz a conexão com o banc0. Para testar localmente, 
comente a linha do include e adicione

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Content-Type");


define('DB_NAME', 'approveite');
define('DB_USER', 'root');
define('DB_PASSWORD', '');
define('DB_HOST', 'localhost');

$Mysqli = new mysqli(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);

*/

include_once 'conn.php'; 
 
$request = $_SERVER['REQUEST_METHOD'] == 'GET' ? $_GET : $_POST;
 
switch ($request['acao']) { 
	case "login":
		$email = addslashes($_POST['email']);
		$senha = addslashes($_POST['senha']);
		$arr = array();
 
        $query = "select * from usuario where email = '{$email}' and senha = '{$senha}'";
        $result = $Mysqli->query($query);

    	if($result->num_rows > 0){
            
            //usuario loga
            $obj = $result->fetch_object();
            
            $arr['result'] = true;
            $arr['dados']['nome'] = $obj->nome;
        }else{
            $arr['result'] = false;
            $arr['msg'] = "E-mail ou senha incorreto";
        }
        echo json_encode($arr);
        
        break;

    case "cadastro":
        $nome = addslashes($_POST['nome']);
        $email = addslashes($_POST['email']);
        $senha = addslashes($_POST['senha']);

        $erro = "";
        $erro .= empty($nome) ? "Informe o seu nome \n" : "";
        $erro .= empty($email) ? "Informe o seu email \n" : "";
        $erro .= empty($senha) ? "Informe a sua senha \n" : "";

        $arr = array();

        if(empty($erro)){
            $query = "INSERT INTO usuario (nome, email, senha) VALUES ('{$nome}', '{$email}', '{$senha}')";
            $result = $Mysqli->query($query);
            $arr['result'] = true;
            $arr['dados']['nome'] = $nome;
        }else{
            $arr['result'] = false;
            $arr['msg'] = $erro;;
        }
        echo json_encode($arr);
        break;
}
