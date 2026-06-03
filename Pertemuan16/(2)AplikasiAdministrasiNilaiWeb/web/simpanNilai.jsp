<%@page import="java.util.ArrayList"%>

<%

String nim = request.getParameter("nim");
String nama = request.getParameter("nama");
String matkul = request.getParameter("matkul");

int nilai = Integer.parseInt(request.getParameter("nilai"));

String grade;

if(nilai >= 85){
grade = "A";
}
else if(nilai >= 70){
grade = "B";
}
else if(nilai >= 60){
grade = "C";
}
else{
grade = "D";
}

ArrayList dataNilai = (ArrayList)session.getAttribute("dataNilai");

if(dataNilai == null){

dataNilai = new ArrayList();

}

dataNilai.add(nim);
dataNilai.add(nama);
dataNilai.add(matkul);
dataNilai.add(nilai);
dataNilai.add(grade);

session.setAttribute("dataNilai", dataNilai);

response.sendRedirect("dataNilai.jsp");

%>