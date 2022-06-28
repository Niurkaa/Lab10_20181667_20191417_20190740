<%--
  Created by IntelliJ IDEA.
  User: Niurka
  Date: 27/06/2022
  Time: 19:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--Navbar-->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<nav class="navbar sticky-top navbar-expand-lg navbar-dark">

    <img src="images/logo.png" width="80" height="85 " align="left"/>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">

        <ul class="navbar-nav">
            <li class="nav-item">
                <a  type="submit"
                    name="Cerrar Sesion"
                    class="btn btn-tele border-start-1"
                    class="nav-link" href="<%=request.getContextPath()%>/?action=logout"><b>Cerrar Sesión</b></a>
            </li>

        </ul>

    </div>
</nav>