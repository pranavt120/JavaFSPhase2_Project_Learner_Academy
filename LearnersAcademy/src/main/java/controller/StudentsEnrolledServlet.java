package controller;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import beans.StudentSubject;
import dao.SubjectEnrnolledDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/studentsEnrolled")
public class StudentsEnrolledServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public StudentsEnrolledServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int classId = Integer.parseInt(request.getParameter("class"));
		List<StudentSubject> studentList = new ArrayList<StudentSubject>();
		studentList = new SubjectEnrnolledDAO().getStudentEnrolledList(classId);
		request.setAttribute("studentList", studentList);
		request.getRequestDispatcher("studentsEnrolled.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
