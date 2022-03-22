package controller;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;

import dao.DeleteClassDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deleteClass")
public class DeleteClass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public DeleteClass() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		boolean isdeleted;
		isdeleted = new DeleteClassDAO().deleteClass(id);
		String msg;
		if(isdeleted) {
			msg="deleted";
		}else {
			msg="error";
		}
		
		request.setAttribute("msg", msg);
		request.getRequestDispatcher("/classes").forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
