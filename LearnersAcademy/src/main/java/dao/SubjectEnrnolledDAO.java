package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.StudentSubject;

public class SubjectEnrnolledDAO {
	
	private final String QUERY = "select `First Name`,`Last Name` from class_report_2 where class_id = ?";
	
	private StudentSubject student;
	private List<StudentSubject> studentList = new ArrayList<StudentSubject>();
	
	public List<StudentSubject> getStudentEnrolledList(int classId){
		try {
			Connection connection = DBConnectionProvider.getConnection();
			PreparedStatement statement = connection.prepareStatement(QUERY);
			
			statement.setInt(1, classId);
			
			
			ResultSet set = statement.executeQuery();
			while(set.next()) {
				student = new StudentSubject();
				student.setFirstName(set.getString(1));
				student.setLastName(set.getString(2));
				
				studentList.add(student);
			}
			return studentList;
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}

}
