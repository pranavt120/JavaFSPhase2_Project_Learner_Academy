package controller;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import beans.Subject;
import beans.SubjectTeacher;
import dao.AddClassDAO;
import dao.AddClassTeacherSubjectRelationDAO;
import dao.FindByClassName;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addClassAction")
public class AddClassActionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public AddClassActionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String[] values = request.getParameterValues("teacherAlloted");
		int subjectId, teacherId;
		String className = (String)session.getAttribute("className");
		boolean isaddedClass = new AddClassDAO().addClass(className);
		int classId = new FindByClassName().findClassIdByName(className);
		boolean isRelationAdded = false;
		
		
		  for(int j=0;j<values.length;j++) { 
			  subjectId = Integer.parseInt(values[j].split(",")[1]); 
			  teacherId = Integer.parseInt(values[j].split(",")[0]); 
			  isRelationAdded = new AddClassTeacherSubjectRelationDAO().addRelation(teacherId, subjectId,  classId); 
		  }
		 
		String msg;
		if(isaddedClass&&isRelationAdded) {
			msg="added";
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
