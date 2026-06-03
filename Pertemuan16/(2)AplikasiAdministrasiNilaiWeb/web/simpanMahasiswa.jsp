<%@page import="java.util.ArrayList"%>

<%

String nim = request.getParameter("nim");
String nama = request.getParameter("nama");
String jurusan = request.getParameter("jurusan");

ArrayList dataMhs = (ArrayList)session.getAttribute("dataMhs");

if(dataMhs == null){

dataMhs = new ArrayList();

}

dataMhs.add(nim);
dataMhs.add(nama);
dataMhs.add(jurusan);

session.setAttribute("dataMhs", dataMhs);

response.sendRedirect("dataMahasiswa.jsp");

%>