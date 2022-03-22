package controller;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;

import dao.AddTeacherDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/addTeacherAction")
public class AddTeacherAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public AddTeacherAction() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String firstName = request.getParameter("firstName");
		String lastName  = request.getParameter("lastName");
		boolean isadded;
		isadded = new AddTeacherDAO().addTeacher(firstName, lastName);
		if(isadded) {
			String msg = "added";
			request.setAttribute("msg", msg);
			request.getRequestDispatcher("/addTeacher").forward(request, response);
		}else {
			String msg = "error";
			request.setAttribute("msg", msg);
			request.getRequestDispatcher("/addTeacher").forward(request, response);
		}
		
	}

}
