package com.ren1kron.service;

import com.ren1kron.Result;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

@WebServlet("/areaCheck")
public class AreaCheckServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }
    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // get params
        float x = Float.parseFloat(request.getParameter("x"));
        float y = Float.parseFloat(request.getParameter("y"));
        float r = Float.parseFloat(request.getParameter("r"));

        // hit check
        boolean hit = hitCheck(x, y, r);

        // get curTime
        LocalDateTime curTime = LocalDateTime.now();
        String time = curTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

        // make Result object
        Result result = new Result(x, y, r, hit, time);

        // Get Http-session (to save new result and get previous)
        HttpSession session = request.getSession();
        ArrayList<Result> results = (ArrayList<Result>) session.getAttribute("results");

        if (results == null)
            results = new ArrayList<>();

        results.add(result);
        session.setAttribute("results", results);

        // set attributes for jsp
        request.setAttribute("currentResult", result);
        request.setAttribute("results", result);

        // redirect on index.jsp
//        request.getRequestDispatcher("/index.jsp").forward(request, response);
        request.getRequestDispatcher("/result.jsp").forward(request, response);

    }
    private boolean hitCheck(float x, float y, float r) {
        // 1st quarter (rectangle)
        if (x > 0 && y > 0 &&
            x<=r/2 && y<= r) {
                return true;
            }
        // 2nd quarter (circle)
        if (x < 0 && y > 0 &&
            Math.pow(x, 2) + Math.pow(y, 2) <= Math.pow(r/2, 2)) {
                return true;
        }
        // 3rd quarter (triangle)
        if (x < 0 && y < 0 &&
            y >= -2*x - r) {
                return true;
        }
        // x == 0
        if (x == 0 &&
            y <= r && y >= -r) {
                return true;
        }
        // y == 0 (if y == 0 and x in area - return true, else - false)
        return y == 0 &&
                x <= r / 2 && x >= r / 2;
    }
}
