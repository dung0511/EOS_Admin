/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import model.Question;

/**
 *
 * @author ADMIN
 */
public class SaveQuestionController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Question p1 = new Question();
        ArrayList<Question> data = p1.getListQuestion();
        String error = "";
        HttpSession session = req.getSession();
        if (data.size() < 1) {
            error = "Number of questions must be greater than 1";
            session.setAttribute("error", error);
            resp.sendRedirect("PRJ301");
        } else {
            session.removeAttribute("error");
//            req.setAttribute("dataPRJ301", data);
            session.setAttribute("examDetail", data);
            resp.sendRedirect("createexam");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect("createexam");
    }

}
