<%--
  Created by IntelliJ IDEA.
  User: Valeria
  Date: 27/06/2022
  Time: 23:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="msg" scope="session" type="java.lang.String" class="java.lang.String"/>
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
    body {
        background-size: cover;
        background-position: center center;
    }
</style>

<body background="images/banner2.jpg">
<div class="modal-dialog modalCenter">
    <div class="modal-content" style="background: black">
        <div class="modal-body" >
            <form class="form-signin" method="post" action="<%=request.getContextPath()%>/?action=register">
                <a href=" "  class="btn btn-danger rounded-pill botonInicio border border-primary" style= "transform: translateX(410px);background-color: black; color: #0d6efd">X</a>

                <center>
                        <td><h4 class="d-flex justify-content-center" style="color:white">Registrarme</h4></td>
                </center>
            <br>

                <center>
                    <table>
                        <tr>
                            <div class="form-floating mb-3">
                                <input type="text" name="name" value="<%=session.getAttribute("name")==null? "" :session.getAttribute("name")%>" required="required" class="form-control" placeholder="Nombres">
                                <label>Nombres</label>
                            </div>
                        </tr>
                        <tr>
                            <div class="form-floating mb-3">
                                <input type="text" name="apellido" value="<%=session.getAttribute("apellido")==null? "" :session.getAttribute("apellido")%>" required="required" class="form-control"  placeholder="Apellidos">
                                <label>Apellidos</label>
                            </div>
                        </tr>
                        <%if(msg.equals("nombresError")){%>
                        <div class="text-danger mb-2">Nombre y apellido no deben empezar con números</div>

                        <%}%>
                        <tr>
                            <div class="form-floating mb-3">
                                <input type="email" value="<%=session.getAttribute("email")==null? "" :session.getAttribute("email")%>" name="email" required="required" class="form-control"  placeholder="Correo">
                                <label>Correo</label>
                            </div>
                        </tr>
                        <%if(msg.equals("emailErrorFormato")){%>
                        <div class="text-danger mb-2">Debe ingresar su correo PUCP con formato numérico</div>
                        <%}%>
                        <%if(msg.equals("existeEmail")){%>
                        <div class="text-danger mb-2">Ya existe una cuenta con este correo</div>
                        <%}%>
                        <tr>
                            <div class="form-floating mb-3">
                                <input type="text" name="especial" value="<%=session.getAttribute("especial")==null? "" :session.getAttribute("especial")%>" required="required" class="form-control"  placeholder="Especialidad">
                                <label>Especialidad</label>
                            </div>
                        </tr>
                        <tr>
                            <td>
                                <div class="form-floating mb-3" width="100px">
                                    <input type="number" min="18" max="30" value="<%=session.getAttribute("edad")==null? "" :session.getAttribute("edad")%>" name="edad" required="required" class="form-control"  placeholder="Edad">
                                    <label>Edad</label>
                                </div>
                            </td>
                            <td>
                                <div class="form-floating mb-3" width="100px">
                                    <input type="number"  value="<%=session.getAttribute("codigo")==null? "" :session.getAttribute("codigo")%>"  name="codigo" required="required" class="form-control"  placeholder="Código Pucp">
                                    <label>Código Pucp</label>
                                </div>
                            </td>
                        </tr>
                        <%if(msg.equals("errorCodigoInt") || msg.equals("errorCodigotamano")){%>
                        <div class="text-danger mb-2">Código PUCP debe ser de 8 dígitos numéricos</div>
                        <%}%>
                        <tr>
                            <td>
                                <div class="form-floating mb-3" width="100px">
                                    <input type="password" name="pass" name="pass" required="required" class="form-control"  placeholder="Contraseña">
                                    <label>Contraseña</label>
                                </div>
                            </td>
                            <td>
                                <div class="form-floating mb-3" width="100px">
                                    <input type="password" name="pass1" required="required" class="form-control"  placeholder="Repetir contraseña">
                                    <label>Repetir contraseña</label>
                                </div>
                            </td>

                        </tr>
                        <%if(msg.equals("malFormatoContra")){%>
                        <div class="text-danger mb-2">La contraseña debe tener una mayúscula, un número y un carácter especial</div>
                        <%}%>
                        <%if(msg.equals("passNoCoinciden")){%>
                        <div class="text-danger mb-2">Las contraseñas no coinciden!</div>
                        <%}%>
                        <%session.removeAttribute("msg");%>
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