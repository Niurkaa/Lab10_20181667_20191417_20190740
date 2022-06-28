<%--
  Created by IntelliJ IDEA.
  User: Niurka
  Date: 27/06/2022
  Time: 19:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Inicio Sesión</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>

<body background="images/fondo.jpg">
<div class="modal-dialog modalCenter">
    <div class="modal-content" style="background: black">
        <div class="modal-body" >
            <form>
                <div class="d-flex justify-content-center"><img src="images/logo.png" style="width: 50%; height: 250px" class="img-fluid">
                </div>
                <br>
                <h4 class="d-flex justify-content-center" style="color:white">Bienvenido TeleViajero</h4>
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="floatingInput1" placeholder="User">
                    <label for="floatingInput1">Usuario</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="password" class="form-control" id="floatingInput2" placeholder="Password">
                    <label for="floatingInput2">Contraseña</label>
                </div>
                <a href="Pagina_principal.html" class="btn btn-danger rounded-pill botonInicio border border-primary" style="transform: translateX(230%); background-color: black; color: #0d6efd">Ingresar</a>
                <br>
                <center><button type="button" data-bs-toggle="modal" class="btn btn-link" data-bs-target="#ventana2">
                    Terminos y condiciones
                </button></center>
                <br>
            </form>
        </div>
    </div>
</div>

<div class="modal fade" id="ventana2" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4>Soy nuevo y deseo registrarme</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

            </div>
            <div class="modal-footer">
                <a class="btn btn-danger botonInicio border border-primary" style=" background-color: blue; color: white">Acepto</a>
            </div>
        </div>
    </div>
</div>

</body>

</html>