package com.ren1kron.service;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/areaCheck")
public class AreaCheckServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }
    private void processRequest(HttpServletRequest request, HttpServletResponse response) {
        // TODO закоммитить достигнутый успех
        // TODO прочитать, что такое HTTP-сессия (gpt уже написал)
        // TODO закончить реализацию AreaCheck
    }
}
