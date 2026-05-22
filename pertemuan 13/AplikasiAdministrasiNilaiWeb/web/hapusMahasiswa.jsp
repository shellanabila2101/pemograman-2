<%@page import="java.util.ArrayList"%>

<%

int index = Integer.parseInt(request.getParameter("index"));

ArrayList dataMhs = (ArrayList)session.getAttribute("dataMhs");

dataMhs.remove(index);
dataMhs.remove(index);
dataMhs.remove(index);

session.setAttribute("dataMhs", dataMhs);

response.sendRedirect("dataMahasiswa.jsp");

%>