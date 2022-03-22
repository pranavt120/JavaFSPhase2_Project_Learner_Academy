package controller;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;

import dao.AddClassTeacherSubjectRelationDAO;
import dao.AddSubjectTeacherRelationDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/allotSubject")
public class AllotSubject extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AllotSubject() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] selectedValue = request.getParameterValues("subjectChosen");
		int teacherId, subjectId;
		teacherId = Integer.parseInt(selectedValue[0].split(",")[0]);
		subjectId = Integer.parseInt(selectedValue[0].split(",")[1]);
		
		boolean isadded = new AddSubjectTeacherRelationDAO().addSubjectTeacherRelation(subjectId, teacherId);
		String msg;
		if(isadded) {
			msg="added";
		}else {
			msg = "error";
		}
		
		request.setAttribute("allocatemsg", msg);
		request.getRequestDispatcher("/teachers").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
