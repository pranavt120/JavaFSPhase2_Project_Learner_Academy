package controller;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import beans.Subject;
import beans.SubjectTeacher;
import beans.Teacher;
import dao.FindSubjectByNameDAO;
import dao.SubjectTeacherDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/fetchTeacher")
public class FetchTeacherForSubjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public FetchTeacherForSubjectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<Subject, List<SubjectTeacher>> mappedListSubjectTeacher = new HashMap<Subject, List<SubjectTeacher>>();
		String sub1 = request.getParameter("subjectChosen1");
		String sub2 = request.getParameter("subjectChosen2");
		String sub3 = request.getParameter("subjectChosen3");
		Subject subject1 = new Subject();
		Subject subject2 = new Subject();
		Subject subject3 = new Subject();
		List<SubjectTeacher> teacherList1 = new ArrayList<SubjectTeacher>();
		List<SubjectTeacher> teacherList2 = new ArrayList<SubjectTeacher>();
		List<SubjectTeacher> teacherList3 = new ArrayList<SubjectTeacher>();
		List<Subject> subjectList = new ArrayList<Subject>();
		subjectList.add(subject1);
		subjectList.add(subject2);
		subjectList.add(subject3);
		
		subject1 = new FindSubjectByNameDAO().findSubjectByName(sub1);
		subject2 = new FindSubjectByNameDAO().findSubjectByName(sub2);
		subject3 = new FindSubjectByNameDAO().findSubjectByName(sub3);
		
		teacherList1 = new SubjectTeacherDAO().getSubjectList(subject1);
		teacherList2 = new SubjectTeacherDAO().getSubjectList(subject2);
		teacherList3 = new SubjectTeacherDAO().getSubjectList(subject3);
		
		mappedListSubjectTeacher.put(subject1, teacherList1);
		mappedListSubjectTeacher.put(subject2, teacherList2);
		mappedListSubjectTeacher.put(subject3, teacherList3);
		
		request.setAttribute("map", mappedListSubjectTeacher);
		
		
		request.getRequestDispatcher("fetchTeacher.jsp").forward(request, response);
		

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
