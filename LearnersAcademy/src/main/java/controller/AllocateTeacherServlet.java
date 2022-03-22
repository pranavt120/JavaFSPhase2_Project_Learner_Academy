package controller;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;
import java.util.List;

import beans.Subject;
import dao.SubjectDAO;
import dao.SubjectsForTeacherDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/allocateTeacher")
public class AllocateTeacherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public AllocateTeacherServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int id  = Integer.parseInt(request.getParameter("id"));
		session.setAttribute("teacherId", id);
		List<Subject> allocatedSubjects = new SubjectsForTeacherDAO().getSubjectsForTeacher(id);
		List<Subject> subjectList = new SubjectDAO().getSubjectList();
		
		request.setAttribute("subjectList", subjectList);
		request.setAttribute("allocatedSubjects", allocatedSubjects);
		request.getRequestDispatcher("allocateTeacher.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
