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
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // here we will validate params
        try {
            // get params
            var x = request.getParameter("xDigit");
            var y = request.getParameter("y");
            var r = request.getParameter("r");

            // Did we get all the values?
            if (x == null || y == null || r == null) {
                request.setAttribute("error", String.format(ERROR_HEAD, "xDigit, y or r are missing"));
                request.getRequestDispatcher("/index.jsp").forward(request, response);
                return;
            }
            else if (x.isEmpty() || y.isEmpty() || r.isEmpty()) {
                request.setAttribute("error", String.format(ERROR_HEAD, "xDigit, y or r are empty"));
                request.getRequestDispatcher("/index.jsp").forward(request, response);
                return;
            }


            // every value should be a number...

                var xDigit = Float.parseFloat(x);
                var yDigit = Float.parseFloat(y);
                var rDigit = Float.parseFloat(r);


            // ... and belong to a certain segment
            if (xDigit < -2 || xDigit > 2) {
                request.setAttribute("error", String.format(ERROR_HEAD, "x should be in [-2; 2]"));
                request.getRequestDispatcher("/index.jsp").forward(request, response);
                return;
            }
            if (yDigit < -5 || yDigit > 5) {
                request.setAttribute("error", String.format(ERROR_HEAD, "y should be in [-5; 5]"));
                request.getRequestDispatcher("/index.jsp").forward(request, response);
                return;
            }
            if (rDigit < 1 || rDigit > 3) {
                request.setAttribute("error", String.format(ERROR_HEAD, "r should be in [1; 3]"));
                request.getRequestDispatcher("/index.jsp").forward(request, response);
                return;
            }

            // if everything is ok – redirect to AreaCheck
            request.getRequestDispatcher("/areaCheck").forward(request, response);
        } catch (NumberFormatException e) {
            request.setAttribute("error", String.format(ERROR_HEAD, e));
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }
}