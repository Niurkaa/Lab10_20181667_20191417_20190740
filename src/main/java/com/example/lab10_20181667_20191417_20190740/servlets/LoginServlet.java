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
        HttpSession session= request.getSession();
        switch (action){
            case "logout":
                session.invalidate();
                response.sendRedirect(request.getContextPath());
                break;
            case "login":
                RequestDispatcher view = request.getRequestDispatcher("InicioSesion.jsp");
                view.forward(request,response);
                break;
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action= request.getParameter("action");
        LoginDao loginDao= new LoginDao();
        switch (action){
            case "login":
                String user= request.getParameter("user");
                String pass= request.getParameter("pass");
                BUsuario alumno =loginDao.encontrarUsuario(user,pass);
                HttpSession session;
                session= request.getSession();
                if(alumno.getIdUsuario()!=0){
                    if(alumno.getEspecialidad().equals("telecomunicaciones")){
                        session.setAttribute("usuarioLog",alumno);
                        response.sendRedirect(request.getContextPath()+"/InicioServlet");
                    }else{
                        session.setAttribute("noExiste","Solo se permite la especialidad de Telecomunicaciones");
                        response.sendRedirect(request.getContextPath());
                    }
                }else{
                    session.setAttribute("noExiste","Usuario o contraseña inválidos");
                    response.sendRedirect(request.getContextPath());
                }
                break;
        }
    }
}
