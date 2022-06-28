<%--
  Created by IntelliJ IDEA.
  User: Niurka
  Date: 27/06/2022
  Time: 19:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="msg" scope="session" type="java.lang.String" class="java.lang.String"/>
<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/logo2.ico" type="image/x-icon">
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
                <div class="d-flex justify-content-center"><img src="images/logo.png" style="width: 50%; height: 250px" class="img-fluid">
                </div>
                <br>
                <form class="form-signin" method="post" action="<%=request.getContextPath()%>/?action=login" >
                <h4 class="d-flex justify-content-center" style="color:white">Bienvenido TeleViajero</h4>
                <div class="form-floating mb-3">
                    <input type="text" name="user" required="required" class="form-control" id="floatingInput1" placeholder="User">
                    <label for="floatingInput1">Usuario</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="password" name="pass" required="required" class="form-control" id="floatingInput2" placeholder="Password">
                    <label for="floatingInput2">Contraseña</label>
                </div>
                    <%if(session.getAttribute("noExiste")!=null){%>
                    <div class="text-danger mb-2"><%=session.getAttribute("noExiste")%></div>
                    <%}%>

                    <%if(msg.equals("Exitoso")){%>
                    <div class="text-success mb-2">Se registró correctamente!</div>
                    <%}%>
                    <%session.invalidate();%>
                <button type="submit" class="btn btn-danger rounded-pill botonInicio border border-primary" style="transform: translateX(230%); background-color: black; color: #0d6efd">Ingresar</button>
                </form>
                <br>
                <center><a href="<%=request.getContextPath()%>/?action=register" type="button" class="btn btn-link" >
                    Soy nuevo y quiero registrarme
                </a></center>
                <br>
        </div>
    </div>
</div>

</div>

</body>

</html>