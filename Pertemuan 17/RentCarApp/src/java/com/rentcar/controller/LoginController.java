package com.rentcar.controller;

import com.rentcar.model.DatabaseConfig;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userParam = request.getParameter("username");
        String passParam = request.getParameter("password");
        
        try {
            Connection conn = DatabaseConfig.getConnection();
            String sql = "SELECT * FROM user WHERE username=? AND password=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, userParam);
            ps.setString(2, passParam);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()) {
                // Login Sukses, buat session
                HttpSession session = request.getSession();
                session.setAttribute("adminUser", userParam);
                response.sendRedirect("index.jsp");
            } else {
                // Login Gagal
                response.sendRedirect("login.jsp?error=true");
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=true");
        }
    }
}