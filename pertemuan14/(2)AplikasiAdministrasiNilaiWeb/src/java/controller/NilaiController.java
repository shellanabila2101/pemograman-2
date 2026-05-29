package controller;

import model.Nilai;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/NilaiController")

public class NilaiController
extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
                          throws ServletException, IOException {

        String nim =
                request.getParameter("nim");

        String nama =
                request.getParameter("nama");

        String matkul =
                request.getParameter("matkul");

        int nilai =
                Integer.parseInt(
                request.getParameter("nilai"));

        String grade;

        if(nilai >= 85){

            grade = "A";

        }else if(nilai >= 70){

            grade = "B";

        }else if(nilai >= 60){

            grade = "C";

        }else{

            grade = "D";
        }

        Nilai n =
                new Nilai(nim,
                           nama,
                           matkul,
                           nilai,
                           grade);

        HttpSession session =
                request.getSession();

        ArrayList<Nilai> dataNilai =
        (ArrayList<Nilai>)
        session.getAttribute("dataNilai");

        if(dataNilai == null){

            dataNilai = new ArrayList<>();

        }

        dataNilai.add(n);

        session.setAttribute("dataNilai",
                             dataNilai);

        response.sendRedirect(
                "dataNilai.jsp");
    }
}