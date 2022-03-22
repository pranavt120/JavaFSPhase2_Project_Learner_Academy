package controller;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;

import dao.AddSubjectDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/addSubjectAction")
public class AddSubjectAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public AddSubjectAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String subjectName = request.getParameter("subjectName");
		boolean isadded = false;
		
		isadded = new AddSubjectDAO().addSubject(subjectName);
		
		if(isadded) {
			String msg = "added";
			request.setAttribute("msg", msg);
			request.getRequestDispatcher("/addSubject").forward(request, response);
		}else {
			String msg = "error";
			request.setAttribute("msg", msg);
			request.getRequestDispatcher("/addSubject").forward(request, response);
		}
	}

}
