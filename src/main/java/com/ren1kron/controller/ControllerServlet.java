package com.ren1kron.controller;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/controller")
public class ControllerServlet extends HttpServlet {
    private static final String ERROR_HEAD = "Invalid data provided: %s";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/areaCheck").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // here we will validate params
        try {
            // get params
            var x = request.getParameter("x");
            var y = request.getParameter("y");
            var r = request.getParameter("r");

            // Did we get all the values?
            if (x == null || y == null || r == null) {
                request.setAttribute("error", String.format(ERROR_HEAD, "x, y or r are missing"));
//                request.getRequestDispatcher("/index.jsp").forward(request, response);
                request.getRequestDispatcher("/index.jsp").forward(request, response);
                return;
            }
            else if (x.isEmpty() || y.isEmpty() || r.isEmpty()) {
                request.setAttribute("error", String.format(ERROR_HEAD, "x, y or r are empty"));
//                request.getRequestDispatcher("/index.jsp").forward(request, response);
                request.getRequestDispatcher("/index.jsp").forward(request, response);
                return;
            }


            // every value should be a number

                Float.parseFloat(x);
                Float.parseFloat(y);
                Float.parseFloat(r);


            // if everything is ok – redirect to AreaCheck
            request.getRequestDispatcher("/areaCheck").forward(request, response);
        } catch (NumberFormatException e) {
            request.setAttribute("error", String.format(ERROR_HEAD, e));
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }
}
