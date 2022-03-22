package controller;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;

import dao.DeleteSubjectDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deleteSubject")
public class DeleteSubject extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public DeleteSubject() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean isdeleted;
		int id = Integer.parseInt(request.getParameter("id"));
		isdeleted = new DeleteSubjectDAO().deleteSubject(id);
		if(isdeleted) {
			String msg = "deleted";
			request.setAttribute("msg", msg);
			request.getRequestDispatcher("/subjects").forward(request, response);
		}else {
			String msg = "error";
			request.setAttribute("msg", msg);
			request.getRequestDispatcher("/subjects").forward(request, response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
