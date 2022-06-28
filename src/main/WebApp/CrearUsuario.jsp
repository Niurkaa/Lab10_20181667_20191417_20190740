<%--
  Created by IntelliJ IDEA.
  User: Valeria
  Date: 27/06/2022
  Time: 23:44
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
<style>
    td{
        padding: 10px;
    }
</style>

<body background="images/fondo2.jpg">
<div class="modal-dialog modalCenter">
    <div class="modal-content" style="background: black">
        <div class="modal-body" >
            <form class="form-signin"  >
                <h4 class="d-flex justify-content-center" style="color:white">Registrarme</h4>
                <center>
                    <table>
                        <tr>
                            <div class="form-floating mb-3">
                                <input type="text" required="required" class="form-control" placeholder="Nombres">
                                <label>Nombres</label>
                            </div>
                        </tr>
                        <tr>
                            <div class="form-floating mb-3">
                                <input type="text" required="required" class="form-control"  placeholder="Apellidos">
                                <label>Apellidos</label>
                            </div>
                        </tr>
                        <tr>
                            <div class="form-floating mb-3">
                                <input type="text" required="required" class="form-control"  placeholder="Correo">
                                <label>Correo</label>
                            </div>
                        </tr>
                        <tr>
                            <div class="form-floating mb-3">
                                <input type="text" required="required" class="form-control"  placeholder="Especialidad">
                                <label>Especialidad</label>
                            </div>
                        </tr>
                        <tr>
                            <td>
                                <div class="form-floating mb-3" width="100px">
                                    <input type="int"  required="required" class="form-control"  placeholder="Edad">
                                    <label>Edad</label>
                                </div>
                            </td>
                            <td>
                                <div class="form-floating mb-3" width="100px">
                                    <input type="int"  required="required" class="form-control"  placeholder="Código Pucp">
                                    <label>Código Pucp</label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="form-floating mb-3" width="100px">
                                    <input type="password" name="pass" required="required" class="form-control"  placeholder="Contraseña">
                                    <label>Contraseña</label>
                                </div>
                            </td>
                            <td>
                                <div class="form-floating mb-3" width="100px">
                                    <input type="password" name="pass" required="required" class="form-control"  placeholder="Repetir contraseña">
                                    <label>Reptir contraseña</label>
                                </div>
                            </td>

                        </tr>

                    </table>
                    <button type="submit" class="btn btn-danger rounded-pill botonInicio border border-primary" style= "align:center;background-color: black; color: #0d6efd">Registrarme</button>

                </center>

            </form>

            <br>
        </div>
    </div>
</div>

</div>

</body>

</html>