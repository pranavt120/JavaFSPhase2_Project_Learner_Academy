package controller;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import beans.Subject;
import beans.SubjectTeacher;
import dao.SubjectDAO;
import dao.SubjectTeacherDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/subjects")
public class SubjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public SubjectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Subject> subjectList = new ArrayList<Subject>();
		subjectList = new SubjectDAO().getSubjectList();
		
		if(subjectList != null) {
			request.setAttribute("subjectList", subjectList);
			request.getRequestDispatcher("subjects.jsp").forward(request, response);
		}else {
			request.setAttribute("null", "null");
			request.getRequestDispatcher("subjects.jsp").forward(request, response);
		}
		
		

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
