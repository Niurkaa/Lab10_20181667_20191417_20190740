<%--
  Created by IntelliJ IDEA.
  User: Niurka
  Date: 27/06/2022
  Time: 19:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'/>
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/images/logo2.ico" type="image/x-icon">
    <title><%=request.getParameter("title")%>
    </title>


    <style>

        .container {
            padding-right: 0 !important;
            padding-left: 0 !important;
        }

        .titlecolor {
            background: linear-gradient(0deg, #1d1d1d 0%, #525252 100%);
        }

        .navbar {
            position: fixed;
            width: 100%;
            padding: 30px 10px;
            background-color: rgb(0, 0, 0);
        }

        body{
            font-family: Arial;
        }
        #main-container{
            margin: 10px ;
            width: 1200px;
        }



        .btn {
            display: inline-block;
            font-weight: 400;
            line-height: 1.5;
            color: white;
            text-align: center;
            text-decoration: none;
            vertical-align: middle;
            cursor: pointer;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
            background-color: transparent;
            border: 1px solid transparent;
            padding: .375rem .75rem;
            font-size: 1rem;
            border-radius: .25rem;
            transition: color .15s ease-in-out, background-color .15s ease-in-out, border-color .15s ease-in-out, box-shadow .15s ease-in-out
        }


        .btn-tele {
            border-color: #000000FF;
            background-color: #000000FF;
            color: white;
        }

        .btn-tele:hover {
            color: #fff;
            background-color:#525252;
            border-color: #000000FF;
        }

        .btn-check:focus + .btn-tele,
        .btn-tele:focus {
            color: #fff;
            background-color: #525252;
            border-color: #090909;
            box-shadow: 0 0 0 0.2rem #000000FF;
        }

        .btn-check:active + .btn-tele,
        .btn-check:checked + .btn-tele,
        .btn-tele.active,
        .btn-tele:active,
        .show > .btn-tele.dropdown-toggle {
            color: #fff;
            background-color: #000000FF;
            border-color: #000000FF;
        }

        .btn-check:active + .btn-tele:focus,
        .btn-check:checked + .btn-tele:focus,
        .btn-tele.active:focus,
        .btn-tele:active:focus,
        .show > .btn-tele.dropdown-toggle:focus {
            box-shadow: 0 0 0 0.2rem #000000FF;
        }

        .btn-tele.disabled,
        .btn-tele:disabled {
            color: #fff;
            border-color: #000000FF;
            background-color: #000000FF;
        }

        .btn-tele-inverso {
            background-color: white;
            color: #000000FF;
        }

        .btn-tele-inverso:hover {
            color: #000000FF;
        }

        .btn-check:focus + .btn-tele-inverso,
        .btn-tele-inverso:focus {
            color: #000000FF;
        }

        .btn-check:active + .btn-tele-inverso,
        .btn-check:checked + .btn-tele-inverso,
        .btn-tele-inverso.active,
        .btn-tele-inverso:active,
        .show > .btn-tele-inverso.dropdown-toggle {
            color:#000000FF;
        }

        .btn-check:active + .btn-tele-inverso:focus,
        .btn-check:checked + .btn-tele-inverso:focus,
        .btn-tele-inverso.active:focus,
        .btn-tele-inverso:active:focus,
        .show > .btn-tele-inverso.dropdown-toggle:focus {
            box-shadow: 0 0 0 0.2rem #000000FF;
        }

        /*Desactivar sombra de botones*/

        .btn:focus,
        .btn:active,
        .page-link:focus {
            box-shadow: none !important;
            outline: 0;
        }

        .delete {

            Background: #525252;
            width:35%;
            color:#dddddd;
            font-family: Arial;
            font-size: 18px;
            text-align:center;
            padding: 33px;
            min-height: 100px;
            border-radius: 10px;
            left:33%;
            top:200px;
            position: fixed;
            display: none;
        }





    </style>
</head>
