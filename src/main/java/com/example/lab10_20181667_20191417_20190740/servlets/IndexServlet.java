package com.example.lab10_20181667_20191417_20190740.servlets;

import com.example.lab10_20181667_20191417_20190740.beans.BUsuario;
import com.example.lab10_20181667_20191417_20190740.beans.Seguro;
import com.example.lab10_20181667_20191417_20190740.beans.Viaje;
import com.example.lab10_20181667_20191417_20190740.daos.ViajesDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.swing.text.html.HTML;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "IndexServlet", value = "/IndexServlet")
public class IndexServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");
        ViajesDao viajesDao = new ViajesDao();
        HttpSession session= request.getSession();
        BUsuario usuario = (BUsuario) session.getAttribute("usuarioLog");

        //Borramos caché
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setDateHeader("Expires", 0);
        //Borramos caché

        if(usuario!=null && usuario.getIdUsuario()!=0){
            switch (action){
                case "listar":
                    ArrayList<Viaje> viajes = viajesDao.listar(usuario.getIdUsuario(),"","");
                    request.setAttribute("viajes", viajes);
                    RequestDispatcher listar = request.getRequestDispatcher("index.jsp");
                    listar.forward(request, response);
                    break;
                case "agregar":
                    ArrayList<Seguro> seguros = viajesDao.listarS();
                    request.setAttribute("listaSeguros",seguros);
                    RequestDispatcher agregar = request.getRequestDispatcher("AñadirViaje.jsp");
                    agregar.forward(request,response);
                    break;
                case "editar":
                    String idViaje = (String) session.getAttribute("idViaje");
                    ArrayList<Seguro> seguro = viajesDao.listarS();
                    Viaje viaje = viajesDao.buscarViajePorId(idViaje);
                    request.setAttribute("listaSeguros",seguro);
                    request.setAttribute("viaje",viaje);
                    RequestDispatcher editar = request.getRequestDispatcher("EditarViaje.jsp");
                    editar.forward(request,response);
                    break;
                case "eliminar":
                    String idViaje1 = request.getParameter("idViaje");
                    viajesDao.eliminar(idViaje1);
                    response.sendRedirect(request.getContextPath() + "/IndexServlet");
                    break;
            }
        }else{
            response.sendRedirect(request.getContextPath());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");
        HttpSession session= request.getSession();
        ViajesDao viajesDao = new ViajesDao();
        BUsuario usuario = (BUsuario) session.getAttribute("usuarioLog");
        String ciudadOrigen = request.getParameter("ciudad1");
        String ciudadDestino = request.getParameter("ciudad2") ;

        if(usuario!=null && usuario.getIdUsuario()!=0){
            switch (action){
                case "buscar":
                    //Borramos caché
                    response.setHeader("Pragma", "No-cache");
                    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
                    response.setDateHeader("Expires", 0);
                    //Borramos caché

                    ArrayList<Viaje> viajes = viajesDao.listar(usuario.getIdUsuario(),ciudadOrigen,ciudadDestino);
                    session.setAttribute("ciudadDestino", ciudadDestino);
                    session.setAttribute("ciudadOrigen", ciudadOrigen);
                    request.setAttribute("viajes", viajes);
                    RequestDispatcher listar = request.getRequestDispatcher("index.jsp");
                    listar.forward(request, response);

                    break;
                case "crear":
                    try {
                        String fechaViaje = request.getParameter("fechaViaje");
                        String fechaReserva = request.getParameter("fechaReserva");
                        String idSeguro = request.getParameter("seguro");
                        int seguro = Integer.parseInt(idSeguro);
                        String boletos = request.getParameter("numBoletos");
                        int numBoleto = Integer.parseInt(boletos);
                        String costoTotal = request.getParameter("costo");
                        double costo = Double.parseDouble(costoTotal);

                        if (costo> 0) {
                            viajesDao.anadir(fechaViaje, fechaReserva, seguro, numBoleto, costo, usuario.getIdUsuario(),ciudadDestino,ciudadOrigen);
                            response.sendRedirect(request.getContextPath()+"/IndexServlet");
                        }else{
                            session.setAttribute("msg", "Costo Total inválido");
                            response.sendRedirect(request.getContextPath()+"/IndexServlet?action=agregar");
                        }
                    } catch (NumberFormatException e) {

                        session.setAttribute("msg", "Costo Total inválido");
                        response.sendRedirect(request.getContextPath()+"/IndexServlet?action=agregar");
                    }
                    break;
                case "actualizar":
                    try {
                        String idViaje = (String) session.getAttribute("idViaje");
                        String fechaViaje = request.getParameter("fechaViaje");
                        String fechaReserva = request.getParameter("fechaReserva");
                        String idSeguro = request.getParameter("seguro");
                        int seguro = Integer.parseInt(idSeguro);
                        String boletos = request.getParameter("numBoletos");
                        int numBoleto = Integer.parseInt(boletos);
                        String costoTotal = request.getParameter("costo");
                        double costo = Double.parseDouble(costoTotal);
                        if(costo>0){
                            viajesDao.editar(idViaje, fechaViaje, fechaReserva, seguro, numBoleto, costo, usuario.getIdUsuario(),ciudadDestino,ciudadOrigen);
                            response.sendRedirect(request.getContextPath()+"/IndexServlet");
                        }else{
                            session.setAttribute("msg", "Costo Total inválido");
                            response.sendRedirect(request.getContextPath()+"/IndexServlet?action=editar");
                        }
                    } catch (NumberFormatException e) {
                        session.setAttribute("msg", "Costo Total inválido");
                        response.sendRedirect(request.getContextPath()+"/IndexServlet?action=editar");
                    }
                    break;
            }
        }else{
            response.sendRedirect(request.getContextPath());
        }

    }

}
