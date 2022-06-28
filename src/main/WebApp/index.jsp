<%@ page import="com.example.lab10_20181667_20191417_20190740.beans.Viaje" %><%--
  Created by IntelliJ IDEA.
  User: Niurka
  Date: 27/06/2022
  Time: 19:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="viajes" scope="request" type="java.util.ArrayList<com.example.lab10_20181667_20191417_20190740.beans.Viaje>"/>
<jsp:include page="head.jsp">
    <jsp:param name="title" value="index"/>
</jsp:include>
<!-- CSS Personales-->
<link rel="stylesheet" href="carrusel.css">
<!--Navbar-->
<jsp:include page="navbar.jsp">
    <jsp:param name="page" value=""/>
</jsp:include>

<!-- Banner presentación -->
<html>


<div class="slider_carr">
    <ul>
        <li><img src="images/fondo1.jpg" alt=""></li>
        <li><img src="images/fondo3.jpg" alt=""></li>
        <li><img src="images/fondo1.jpg" alt=""></li>
        <li><img src="images/fondo3.jpg" alt=""></li>
    </ul>
</div>
<!---->
<STYLE TYPE="text/css">
    body{
        font-family: Arial;
    }
    #main-container{
        margin: 10px ;
        width: 1200px;
    }
    table{
        background-color: white;
        text-align: center;
        border-collapse: collapse;
        width: 100%;
        position: static;
        left: 100%;

        top: 300%;
        margin-top: 1px;
    }
    th, td{
        padding: 20px;
    }
    thead{
        background-color: #000000;
        border-bottom: solid 5px #353837;
        color: white;
    }
    tr:nth-child(even){
        background-color: #ddd;
    }
    tr:hover td{
        background-color: #706e6e;
        color: white;
    }

</STYLE>

<br><br>
<center>
    <h1><b><font color="white">LISTA DE VIAJES</font> </b></h1>
</center>

<center>
    <div id="main-container" >

        <table>
            <thead>
            <tr>
                <th>ID</th><th>Fecha de reserva</th><th>Fecha de vuelo</th><th>Cuidad origen</th><th> Ciudad destino</th><th>Empresa de seguro</th> <th>N° boletos</th><th>Costo total</th>
            </tr>
            </thead>
            <tbody>
            <%for (Viaje viaje : viajes){%>
            <tr>
                <td><%=viaje.getId()%></td><td><%=viaje.getFechaReserva()%></td><td><%=viaje.getFechaViaje()%></td><td><%=viaje.getCiudadOrigen()%></td><td><%=viaje.getCiudadDestino()%></td><td><%=viaje.getSeguro().getNombre()%></td><td><%=viaje.getNumBoleto()%></td><td>S/. <%=viaje.getCosto()%></td>
            </tr>
            <%}%>
            </tbody>


        </table>

    </div></center>


</html>