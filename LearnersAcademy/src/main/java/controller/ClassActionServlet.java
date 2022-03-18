package controller;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import beans.ClassReport;
import dao.ClassDetailsDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/classesAction")
public class ClassActionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public ClassActionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String className = request.getParameter("name");
		List<ClassReport> classReportList = new ArrayList<ClassReport>();
		classReportList = new ClassDetailsDAO().getClassReport(className);
		
		request.setAttribute("classReportList", classReportList);
		request.getRequestDispatcher("classDetail.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
