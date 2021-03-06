<%@ page import="com.example.lab10_20181667_20191417_20190740.beans.Viaje" %>

  Created by IntelliJ IDEA.
  User: Niurka
  Date: 27/06/2022
  Time: 19:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="head.jsp">
    <jsp:param name="title" value="index"/>
</jsp:include>
<!-- CSS Personales-->
<link rel="stylesheet" href="carrusel.css">
<!--Navbar-->
<jsp:include page="navbar.jsp">
    <jsp:param name="page" value=""/>
</jsp:include>
<jsp:useBean id="viajes" scope="request" type="java.util.ArrayList<com.example.lab10_20181667_20191417_20190740.beans.Viaje>"/>
<jsp:useBean id="ciudadOrigen" scope="session" type="java.lang.String" class="java.lang.String"/>
<jsp:useBean id="ciudadDestino" scope="session" type="java.lang.String" class="java.lang.String"/>
<!-- Banner presentación -->
<html>

<div class="slider_carr">
    <ul>
        <li><img src="images/bannerbrasil.jpeg" alt=""></li>
        <li><img src="images/dubai.jpg" alt=""></li>
        <li><img src="images/cancun.jpg" alt=""></li>
        <li><img src="images/dubai.jpg" alt=""></li>

    </ul>
</div>
<!---->
<STYLE TYPE="text/css">
    body{
        font-family: Arial;
    }
    #cerrar {
        position:absolute;
        right:4px;
        top:2px
    }
    #main-container{
        margin: 10px ;
        width: 1200px;
    }
    table.clase{
        background-color: white;
        text-align: center;
        border-collapse: collapse;
        width: 100%;
        position: static;
        left: 100%;

        top: 300%;
        margin-top: 1px;
    }
    th.clase, td.clase{
        padding: 20px;
    }
    thead.clase{
        background-color: #000000;
        border-bottom: solid 5px #353837;
        color: white;
    }
    tr.clase:nth-child(even){
        background-color: #ddd;
    }
    tr.clase:hover td{
        background-color: #706e6e;
        color: white;
    }

</STYLE>
<br><br><br>
<center>
    <form method="post" action="<%=request.getContextPath()%>/IndexServlet?action=buscar">
<table>
    <tr>
        <td >
            <div  class="cold md" >
                <input class="form-control me-2" type="search" value="<%=ciudadOrigen%>" placeholder="Ingrese Origen" aria-label="Ingrese Origen" name = "ciudad1">
            </div>
        </td>

        <td>
            <div  class="cold md" >
                <input class="form-control me-2" type="search" value="<%=ciudadDestino%>" placeholder="Ingrese Destino" aria-label="Ingrese Destino" name="ciudad2">
            </div>

        </td>
        <%session.removeAttribute("ciudadOrigen");session.removeAttribute("ciudadDestino");%>
        <td>
            <button  type="submit"
                color="white"
                class="btn btn-tele border-start-1"
                 ><b>Buscar</b></button>
        </td>

    </tr>
</table>
    </form>
</center>
<br><br>
<br><br>
<center>
    <h1><b><font color="Black">LISTA DE VIAJES</font> </b></h1>
</center>
<br>
<center>
    <div id="main-container" >

        <table class="clase">
            <thead class="clase">
            <tr class="clase">
                <th class="clase">ID</th ><th class="clase">Fecha de reserva</th><th class="clase">Fecha de vuelo</th><th class="clase">Cuidad origen</th><th class="clase"> Ciudad destino</th><th class="clase">Empresa de seguro</th> <th class="clase">N° boletos</th><th class="clase">Costo total (S/.)</th><th class="clase">Editar</th> <th class="clase">Eliminar</th>
            </tr>
            </thead>

            <%for (Viaje viaje : viajes){%>
            <form method="post" action="<%=request.getContextPath()%>/IndexServlet?action=editar">
            <input type="hidden" value="<%=viaje.getId()%>" name="idViaje">
            <tr class="clase">
                <td class="clase"><%=viaje.getId()%></td><td class="clase"><%=viaje.getFechaReserva()%></td><td class="clase"><%=viaje.getFechaViaje()%></td><td class="clase"><%=viaje.getCiudadOrigen()%></td><td class="clase"><%=viaje.getCiudadDestino()%></td><td class="clase"><%=viaje.getSeguro().getNombre()%></td><td class="clase"><%=viaje.getNumBoleto()%></td><td class="clase"><%=viaje.getCosto()%></td>
                <td> <button type="submit"
                        name="Buscar"
                        color="white"
                        class="btn btn-tele border-start-1"><b>Editar</b></button> </td>
            </form>
                <td> <a href="javascript:abrir<%=viaje.getId()%>()"
                        type="submit"
                             color="white"
                             class="btn btn-tele border-start-1"
                ><b>Eliminar</b></a> </td>
            </tr>
            <%}%>


        </table>
        <br>
        <%if(session.getAttribute("msg")!=null && session.getAttribute("msg").equals("Contraseña Incorrecta")){%>
        <div class="text-danger mb-2"><%=session.getAttribute("msg")%>!</div>
        <%session.removeAttribute("msg");%>
        <%}%>

        <%if(session.getAttribute("msg")!=null && session.getAttribute("msg").equals("Contraseña Correcta")){%>
        <div class="text-success mb-2">Se eliminó viaje correctamente!</div>
        <%session.removeAttribute("msg");%>
        <%}%>
        <br>
        <a  href="<%=request.getContextPath()%>/IndexServlet?action=agregar" type="button"
        name="Buscar"
        color="white"
        class="btn btn-tele border-start-1"
        ><b>Añadir Viaje</b></a>

    </div></center>
    <%for (Viaje viaje : viajes){%>
    <div class="delete" id="dele<%=viaje.getId()%>">
        <div id="cerrar"><a href="javascript:cerrar<%=viaje.getId()%>()"><img width="20px" height="20px" src="images/x.png"></a></div>
    <center>
        <h5>¿Está seguro que desea eliminar este viaje (ID:<%=viaje.getId()%>) ?</h5>
        <br>
        <h6>Si es así, Ingrese su contraseña para confirmar: </h6>
        <form method="post" action="<%=request.getContextPath()%>/IndexServlet?action=eliminar">
            <input type="hidden" value="<%=viaje.getId()%>" name="idViaje">
        <div class="modal-body" >
        <div  class="cold md" >
            <input type="password" name="pass" required="required" class="form-control" id="floatingInput2" placeholder="Password">
        </div></div>
        <div>
        <button  type="submit"
                  name="delete"
                  class="btn btn-tele border-start-1"
                 > Eliminar </button></div></center>
        </form>
    </div>
    <script>
        function abrir<%=viaje.getId()%>() {
            document.getElementById("dele<%=viaje.getId()%>").style.display="block";
        }
        function cerrar<%=viaje.getId()%>() {
            document.getElementById("dele<%=viaje.getId()%>").style.display="none";
        }
    </script>
    <%}%>



</html>