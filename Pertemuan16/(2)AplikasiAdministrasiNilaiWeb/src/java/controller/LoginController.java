package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/LoginController")

public class LoginController extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
                          throws ServletException, IOException {

        String username =
                request.getParameter("username");

        String password =
                request.getParameter("password");

        if(username.equals("admin")
           && password.equals("123")){

            HttpSession session =
                    request.getSession();

            session.setAttribute("login",
                                 "admin");

            response.sendRedirect("index.jsp");

        }else{

            response.sendRedirect("login.jsp");

        }
    }
}