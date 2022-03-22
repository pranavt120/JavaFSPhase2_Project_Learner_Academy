package controller;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;

import dao.AdminDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/loginAction")
public class LoginActionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginActionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String email = request.getParameter("email");
		 String password = request.getParameter("password");
		 AdminDAO admin = new AdminDAO();
		 boolean isValidate = admin.validateAdmin(email, password);
		 if(isValidate) {
			 session.setAttribute("username", email);
			 String msg = "valid";
			 request.setAttribute("msg", msg);
			 request.getRequestDispatcher("/adminHome").forward(request, response);
		 }else {
			 String msg = "invalid";
			 request.setAttribute("msg", msg);
			 request.getRequestDispatcher("/").forward(request, response);
		 }
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
