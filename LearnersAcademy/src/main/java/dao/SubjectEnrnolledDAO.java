package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.Student;

public class SubjectEnrnolledDAO {
	
	private final String QUERY = "select subject_name,student_first_name,student_last_name from class_report where subject_name= ?";
	private Student student;
	private List<Student> studentList = new ArrayList<Student>();
	
	public List<Student> getStudentEnrolledList(String subject){
		try {
			Connection connection = DBConnectionProvider.getConnection();
			PreparedStatement statement = connection.prepareStatement(QUERY);
			
			statement.setString(1, subject);
			
			ResultSet set = statement.executeQuery();
			while(set.next()) {
				student = new Student();
				student.setSubjects(set.getString(1));
				student.setFirstName(set.getString(2));
				student.setLastName(set.getString(3));
				
				studentList.add(student);
			}
			for(int i=0;i<studentList.size();i++) {
				System.out.println(studentList.get(i).getFirstName());
			}
			return studentList;
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}

}
