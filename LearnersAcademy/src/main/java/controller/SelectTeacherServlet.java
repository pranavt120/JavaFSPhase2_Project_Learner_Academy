package controller;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;

import dao.AddClassDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/selectTeacher")
public class SelectTeacherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public SelectTeacherServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String className  = request.getParameter("className");
		HttpSession session = request.getSession();
		session.setAttribute("className", className);
		
		request.getRequestDispatcher("/fetchTeacher").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
