<%@ page import="com.example.lab10_20181667_20191417_20190740.beans.Seguro" %>
<%@ page import="java.time.LocalDate" %><%--
  Created by IntelliJ IDEA.
  User: Niurka
  Date: 28/06/2022
  Time: 14:47
  To change this template use File | Settings | File Templates.
--%>

<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/logo2.ico" type="image/x-icon">
<jsp:useBean id="listaSeguros" scope="request" type="java.util.ArrayList<com.example.lab10_20181667_20191417_20190740.beans.Seguro>"/>
<jsp:useBean id="viaje" scope="request" type="com.example.lab10_20181667_20191417_20190740.beans.Viaje"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%LocalDate lo_date = LocalDate.now();  %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Inicio Sesión</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<style>
    body {
        background-size: cover;
        background-position: center center;
    }
</style>
<body background="images/paris.jpg">
<div class="modal-dialog modalCenter">
    <div class="modal-content" style="background: black">
        <div class="modal-body" >
            <form method="post" action="<%=request.getContextPath()%>/IndexServlet?action=actualizar">
                <a href="<%=request.getContextPath()%>/IndexServlet"   class="btn btn-danger rounded-pill botonInicio border border-primary" style="transform: translateX(410px);background-color: black; color: #0d6efd">X</a>
                <h4 class="d-flex justify-content-center" style="color:white">Editar Viaje</h4>
                <input type="hidden" value="<%=viaje.getId()%>" name="idViaje">
                <tr>
                    <td>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" name="ciudad1" value="<%=viaje.getCiudadOrigen()%>" required>
                            <label>Ciudad de Origen</label>
                        </div>
                    </td>
                    <td>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" name="ciudad2" value="<%=viaje.getCiudadDestino()%>" required>
                            <label>Ciudad de destino</label>
                        </div>

                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="form-floating mb-3">
                            <input type="date" class="form-control" name="fechaViaje" value="<%=viaje.getFechaViaje()%>" min="<%=lo_date%>">
                            <label> Fecha de viaje</label>
                        </div>
                    </td>
                    <td>
                        <div class="form-floating mb-3">
                            <input type="date" class="form-control" name="fechaReserva"  value="<%=viaje.getFechaReserva()%>" max="<%=lo_date%>">
                            <label> Fecha de reserva</label>
                        </div>
                    </td>
                    <td>
                        <div class="form-floating mb-3">
                            <select name="seguro" class="form-control"><br>
                                <%for(Seguro seguro: listaSeguros){%>
                                <option value="<%=seguro.getId()%>" <%=seguro.getNombre().equals(viaje.getSeguro().getNombre()) ?"selected" : ""%> class="form-control"><%=seguro.getNombre()%></option>
                                <%}%>
                            </select>
                            <label> Seguro</label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td><div class="form-floating mb-3">
                        <input type="number" class="form-control" name="numBoletos" value = "<%=viaje.getNumBoleto()%>" min="0">
                        <label> N° de boletos</label></div></td>
                    <td>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" name= "costo" value="<%=viaje.getCosto()%>">
                            <label> Costo Total (S/.)</label></div>
                    </td>
                </tr>
                <%if(session.getAttribute("msg")!=null){%>
                <div class="text-danger mb-2"><%=session.getAttribute("msg")%></div>
                <%session.removeAttribute("msg");%>
                <%}%>
                </tables>
                <center>
                    <button type="submit" class="btn btn-danger rounded-pill botonInicio border border-primary" style=" background-color: black; color: #0d6efd">Editar Viaje</button>
                </center>
            </form>
        </div>
    </div>
</div>



</body>
</html>