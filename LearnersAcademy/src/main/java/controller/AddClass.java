package controller;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;
import java.util.List;

import beans.Subject;
import dao.SubjectDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/addClass")
public class AddClass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public AddClass() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Subject> subjectList = new SubjectDAO().getSubjectList();
		request.setAttribute("subjectList",  subjectList);
		request.getRequestDispatcher("addClass.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
