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
        BUsuario usuario = session.getAttribute("usuarioLog")== null? new BUsuario() : (BUsuario) session.getAttribute("usuarioLog");
        String ciudadOrigen = request.getParameter("ciudad1") ;
        String ciudadDestino = request.getParameter("ciudad2") ;
        if(usuario.getIdUsuario()==0){
            response.sendRedirect(request.getContextPath());
        }else{
            switch (action){
                case "listar":
                    ArrayList<Viaje> viajes = viajesDao.listar(usuario.getIdUsuario(),ciudadOrigen,ciudadDestino);
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
                    String idViaje = request.getParameter("idViaje");
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
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");
        ViajesDao viajesDao = new ViajesDao();
        String id = request.getParameter("id") == null ? "1" : request.getParameter("id");
        String ciudadOrigen = request.getParameter("ciudad1");
        String ciudadDestino = request.getParameter("ciudad2") ;
        switch (action){
            case "buscar":
                try {
                    int id1 = Integer.parseInt(id);
                    if (id1 != 0) {
                        ArrayList<Viaje> viajes = viajesDao.listar(id1,ciudadOrigen,ciudadDestino);
                        request.setAttribute("viajes", viajes);
                        RequestDispatcher listar = request.getRequestDispatcher("index.jsp");
                        listar.forward(request, response);
                    }
                } catch (NumberFormatException e) {
                    System.out.println("Error al convertir tipo de dato");
                    response.sendRedirect(request.getContextPath() + "/IndexServlet");
                }
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
                    int id1 = Integer.parseInt(id);
                    if (id1 != 0) {
                        viajesDao.anadir(fechaViaje, fechaReserva, seguro, numBoleto, costo, id1,ciudadDestino,ciudadOrigen);
                        response.sendRedirect(request.getContextPath()+"/IndexServlet");
                    }
                } catch (NumberFormatException e) {
                    System.out.println("Error al convertir tipo de dato");
                    response.sendRedirect(request.getContextPath() + "/IndexServlet");
                }
                break;
            case "actualizar":
                try {
                    String idViaje = request.getParameter("idViaje");
                    String fechaViaje = request.getParameter("fechaViaje");
                    String fechaReserva = request.getParameter("fechaReserva");
                    String idSeguro = request.getParameter("seguro");
                    int seguro = Integer.parseInt(idSeguro);
                    String boletos = request.getParameter("numBoletos");
                    int numBoleto = Integer.parseInt(boletos);
                    String costoTotal = request.getParameter("costo");
                    double costo = Double.parseDouble(costoTotal);
                    int id1 = Integer.parseInt(id);
                    if (id1 != 0) {
                        viajesDao.editar(idViaje, fechaViaje, fechaReserva, seguro, numBoleto, costo, id1,ciudadDestino,ciudadOrigen);
                        response.sendRedirect(request.getContextPath()+"/IndexServlet");
                    }
                } catch (NumberFormatException e) {
                    System.out.println("Error al convertir tipo de dato");
                    response.sendRedirect(request.getContextPath() + "/IndexServlet");
                }
                break;
        }
    }

}
