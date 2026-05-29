<%

String username = request.getParameter("username");
String password = request.getParameter("password");

if(username != null && password != null){

    if(username.equals("admin") && password.equals("123")){

        session.setAttribute("login", "admin");

        response.sendRedirect("index.jsp");

    }else{

        out.println("<script>");
        out.println("alert('Username atau Password Salah');");
        out.println("location='login.jsp';");
        out.println("</script>");

    }

}

%>