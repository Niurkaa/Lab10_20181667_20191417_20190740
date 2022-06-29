<%@ page import="com.example.lab10_20181667_20191417_20190740.beans.BUsuario" %>
<%@ page import="com.example.lab10_20181667_20191417_20190740.daos.ViajesDao" %>
<%@ page import="java.lang.reflect.Array" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.lab10_20181667_20191417_20190740.beans.Viaje" %><%--
  Created by IntelliJ IDEA.
  User: Niurka
  Date: 27/06/2022
  Time: 19:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--Navbar-->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%
    BUsuario usuario= (BUsuario) session.getAttribute("usuarioLog");
    ViajesDao viajesDao= new ViajesDao();
    ArrayList<Viaje> viajes= viajesDao.listar(usuario.getIdUsuario(), "", "");
    double valor = 0d;

for (Viaje viaje : viajes){
    valor += viaje.getCosto();
}%>


<nav class="navbar sticky-top navbar-expand-lg " style="background-color: <%=valor<100 ? "#0040ff" : ((valor >=100 && valor<= 1000) ? "#808080" : ((valor >=1000 && valor<= 10000) ? "#cc9900" : "black"))%>" >
    <!---->
    <img src="images/logosinfondo.png" width="80" height="85 " align="left"/>
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