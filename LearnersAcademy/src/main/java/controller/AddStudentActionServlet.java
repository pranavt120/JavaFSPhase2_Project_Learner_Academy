package controller;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;

import dao.AddStudentDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/addStudentAction")
public class AddStudentActionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AddStudentActionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		boolean isadded;
		isadded = new AddStudentDAO().addStudent(firstName, lastName);
		String msg;
		if(isadded) msg = "added";
		else msg = "error";
		
		request.setAttribute("msg", msg);
		request.getRequestDispatcher("/addStudent").forward(request, response);
		
	}

}
