<%--
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

<!-- Banner presentación -->
<div class="slider_carr">
    <ul>
        <li><img src="images/fondo1.jpg" alt=""></li>
        <li><img src="images/fondo3.jpg" alt=""></li>
        <li><img src="images/fondo1.jpg" alt=""></li>
        <li><img src="images/fondo3.jpg" alt=""></li>
    </ul>
</div>
<!---->
