package com.example.lab10_20181667_20191417_20190740.servlets;

import com.example.lab10_20181667_20191417_20190740.beans.BUsuario;
import com.example.lab10_20181667_20191417_20190740.daos.LoginDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action")==null ? "login" : request.getParameter("action");
        RequestDispatcher view;
        HttpSession session= request.getSession();
        BUsuario bUsuario= (BUsuario) session.getAttribute("usuarioLog");

        //Borramos caché
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setDateHeader("Expires", 0);
        //Borramos caché

        if(bUsuario != null){
            if (action.equals("logout")) {
                session.invalidate();
                response.sendRedirect(request.getContextPath());
            }else{
                response.sendRedirect(request.getContextPath()+"/IndexServlet");
            }
        }else{
            switch (action){
                case "login":
                    view= request.getRequestDispatcher("InicioSesion.jsp");
                    view.forward(request,response);
                    break;
                case "register":
                    view = request.getRequestDispatcher("CrearUsuario.jsp");
                    view.forward(request,response);
            }
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action= request.getParameter("action");
        LoginDao loginDao= new LoginDao();
        String pass;
        HttpSession session;
        session= request.getSession();
        switch (action){
            case "login":
                String user= request.getParameter("user");
                pass= request.getParameter("pass");
                BUsuario alumno =loginDao.encontrarUsuario(user,pass);
                if(alumno.getIdUsuario()!=0){
                    if(alumno.getEspecialidad().equals("telecomunicaciones")){
                        session.setAttribute("usuarioLog",alumno);
                        response.sendRedirect(request.getContextPath()+"/IndexServlet");
                    }else{
                        session.setAttribute("noExiste","Solo se permite la especialidad de Telecomunicaciones");
                        response.sendRedirect(request.getContextPath());
                    }
                }else{
                    session.setAttribute("noExiste","Usuario o contraseña inválidos");
                    response.sendRedirect(request.getContextPath());
                }
                break;
            case "register":
                String name= request.getParameter("name");
                String apellido= request.getParameter("apellido");
                String email= request.getParameter("email");
                String especial= request.getParameter("especial");
                String edadstr= request.getParameter("edad");
                String codigostr= request.getParameter("codigo");
                pass= request.getParameter("pass");
                String pass1= request.getParameter("pass1");
                session.setAttribute("name", name);
                session.setAttribute("apellido", apellido);
                session.setAttribute("especial", especial);
                if(loginDao.noEmpezarNumero(name) && loginDao.noEmpezarNumero(apellido)){
                    session.setAttribute("email", email);
                    if(loginDao.correoFormNumPUCP(email)){
                        if(!loginDao.existeCorreo(email)){
                            try{
                                int codigo= Integer.parseInt(codigostr);
                                int edad= Integer.parseInt(edadstr);
                                session.setAttribute("edad", edad);
                                session.setAttribute("codigo", codigo);
                                if(((int)Math.log10(codigo))+1==8){
                                    if(loginDao.passValida(pass) && loginDao.passValida(pass1)){
                                        if(pass.equals(pass1)){
                                            session.setAttribute("msg","Exitoso");
                                            loginDao.crearUsuario(name,apellido,edad,codigo,email,especial,pass);
                                            response.sendRedirect(request.getContextPath());
                                        }else{
                                            session.setAttribute("msg","passNoCoinciden");
                                            response.sendRedirect(request.getContextPath()+"/?action=register");
                                        }
                                    }else{
                                        session.setAttribute("msg","malFormatoContra");
                                        response.sendRedirect(request.getContextPath()+"/?action=register");
                                    }
                                }else{
                                    session.setAttribute("msg","errorCodigotamano");
                                    response.sendRedirect(request.getContextPath()+"/?action=register");
                                }
                            }catch(NumberFormatException e){
                                session.setAttribute("msg","errorCodigoInt");
                                response.sendRedirect(request.getContextPath()+"/?action=register");
                            }
                        }else{
                            session.setAttribute("email", email);
                            session.setAttribute("msg","existeEmail");
                            response.sendRedirect(request.getContextPath()+"/?action=register");
                        }
                    }else{
                        session.setAttribute("email", email);
                        session.setAttribute("msg","emailErrorFormato");
                        response.sendRedirect(request.getContextPath()+"/?action=register");
                    }
                }else{
                    session.setAttribute("msg","nombresError");
                    response.sendRedirect(request.getContextPath()+"/?action=register");
                }
                break;
        }
    }
}
