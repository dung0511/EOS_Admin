/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.Question;

/**
 *
 * @author ADMIN
 */
public class DeleteQuestionController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Question p = new Question();
        p.deleteAll();
        resp.sendRedirect("/EOS_ADMIN/CreateExam.jsp");

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String ques = req.getParameter("questionNo");
        System.out.println(ques);
        Question p = new Question();
        p.delete(Integer.parseInt(ques));
        resp.sendRedirect("/EOS_ADMIN/PRJ301");
    }

}
