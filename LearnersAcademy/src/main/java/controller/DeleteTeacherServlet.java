package controller;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;

import dao.DeleteTeacherDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deleteTeacher")
public class DeleteTeacherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public DeleteTeacherServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		boolean isdeleted;
		isdeleted = new DeleteTeacherDAO().deleteTeacher(id);
		String msg;
		if(isdeleted) {
			 msg = "deleted";
		}else {
			 msg = "error";
		}
		request.setAttribute("msg", msg);
		request.getRequestDispatcher("/teachers").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
