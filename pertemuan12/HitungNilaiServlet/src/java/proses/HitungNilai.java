package proses;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/HitungNilai")
public class HitungNilai extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        int nilai = Integer.parseInt(request.getParameter("nilai"));

        String hasil;

        if (nilai >= 75) {
            hasil = "LULUS";
        } else {
            hasil = "TIDAK LULUS";
        }

        try (PrintWriter out = response.getWriter()) {

            out.println("<html>");
            out.println("<body>");

            out.println("<h2>Hasil Nilai</h2>");

            out.println("Nilai : " + nilai + "<br>");
            out.println("Keterangan : " + hasil);

            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}