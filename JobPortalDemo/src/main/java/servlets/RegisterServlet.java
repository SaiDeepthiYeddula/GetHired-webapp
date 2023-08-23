package servlets;

import Services.MySQLdb;
import models.UserModel;


import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "RegisterServlet", value = "/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fname =request.getParameter("fname");
        String lname =request.getParameter("lname");
        String email =request.getParameter("email");
        String password =request.getParameter("password");
        String profession =request.getParameter("prof");
        MySQLdb db = MySQLdb.getInstance();

        try {
            boolean result = db.doSignup(fname, lname, email, password, profession);

            if(result) {
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("register.jsp");
                request.setAttribute("message", "Success.!");
                requestDispatcher.forward(request, response);
            } else {
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("register.jsp");
                request.setAttribute("message", "Something went wrong! Server error.!");
                requestDispatcher.forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
