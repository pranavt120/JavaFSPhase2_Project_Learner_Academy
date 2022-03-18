package controller;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import beans.Class;
import dao.ClassDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/classes")
public class ClassesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ClassesServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<beans.Class> classList = new ArrayList<Class>();
		classList =  new ClassDAO().getClassList();
		
		request.setAttribute("classList", classList);
		
		request.getRequestDispatcher("classes.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
