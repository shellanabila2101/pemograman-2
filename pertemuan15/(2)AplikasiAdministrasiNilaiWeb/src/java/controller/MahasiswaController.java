package controller;

import model.mahasiswa;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/MahasiswaController")

public class MahasiswaController
extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
                          throws ServletException, IOException {

        String nim =
                request.getParameter("nim");

        String nama =
                request.getParameter("nama");

        String jurusan =
                request.getParameter("jurusan");

        mahasiswa mhs =
                new mahasiswa(nim,
                              nama,
                              jurusan);

        HttpSession session =
                request.getSession();

        ArrayList<mahasiswa> dataMhs =
        (ArrayList<mahasiswa>)
        session.getAttribute("dataMhs");

        if(dataMhs == null){

            dataMhs = new ArrayList<>();

        }

        dataMhs.add(mhs);

        session.setAttribute("dataMhs",
                             dataMhs);

        response.sendRedirect(
                "dataMahasiswa.jsp");
    }
}