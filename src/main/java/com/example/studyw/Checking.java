package com.example.studyw;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.*;

import jakarta.servlet.ServletException;

@WebServlet("/login")
public class Checking extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if(email.equalsIgnoreCase("seth@me.com") && password.equals("123")) {
            HttpSession session = request.getSession();
            session.setAttribute("email", email);
            request.getRequestDispatcher("student.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Invalid");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
}