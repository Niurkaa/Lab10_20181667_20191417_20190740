<%@ page import="com.example.lab10_20181667_20191417_20190740.beans.Seguro" %>
<%@ page import="java.time.LocalDate" %><%--
  Created by IntelliJ IDEA.
  User: Valeria
  Date: 28/06/2022
  Time: 03:07
  To change this template use File | Settings | File Templates.
--%>
<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/logo2.ico" type="image/x-icon">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="listaSeguros" scope="request" type="java.util.ArrayList<com.example.lab10_20181667_20191417_20190740.beans.Seguro>"/>
<%LocalDate lo_date = LocalDate.now();  %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Inicio Sesión</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
<body background="images/fondo2.jpg">
<div class="modal-dialog modalCenter">
    <div class="modal-content" style="background: black">
        <div class="modal-body" >
            <form method="post" action="<%=request.getContextPath()%>/IndexServlet?action=crear">
                <a href="<%=request.getContextPath()%>/IndexServlet"   class="btn btn-danger rounded-pill botonInicio border border-primary" style="transform: translateX(410px);background-color: black; color: #0d6efd">X</a>
                <h4 class="d-flex justify-content-center" style="color:white">Añadir Viaje</h4>
                <tr>
                       <td>0
                           <div class="form-floating mb-3">
                               <input type="text" name="ciudad1" class="form-control" required >
                               <label>Ciudad de Origen</label>
                           </div>
                       </td>
                        <td>
                            <div class="form-floating mb-3">
                                <input type="text" name ="ciudad2" class="form-control" required>
                                <label>Ciudad de destino</label>

                            </div>

                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="form-floating mb-3">
                                <input type="date" class="form-control"  name="fechaViaje" min="<%=lo_date%>">
                                <label> Fecha de viaje</label>
                            </div>
                        </td>
                        <td>
                            <div class="form-floating mb-3">
                                <input type="date" class="form-control"  name="fechaReserva" max="<%=lo_date%>">
                                <label> Fecha de reserva</label>
                            </div>
                        </td>
                        <td>
                            <div class="form-floating mb-3">
                            <select name="seguro" class="form-control"><br>
                                <option selected="yes">---Seleccionar Seguro---</option>
                                <%for(Seguro seguro: listaSeguros){%>
                                <option value="<%=seguro.getId()%>"  class="form-control"><%=seguro.getNombre()%></option>
                                <%}%>
                            </select>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td><div class="form-floating mb-3">
                            <input type="number" class="form-control" name="numBoletos" min="0">
                            <label> N° de boletos</label></div></td>
                        <td>
                            <div class="form-floating mb-3">
                            <input type="text" class="form-control"  name="costo" required>
                                <label> Costo Total (S/.)</label></div>
                        </td>
                    </tr>

                </tables>
                <center>
                <button type="submit" class="btn btn-danger rounded-pill botonInicio border border-primary" style=" background-color: black; color: #0d6efd">Añadir Viaje</button>
                </center>
            </form>
        </div>
    </div>
</div>



</body>
</html>