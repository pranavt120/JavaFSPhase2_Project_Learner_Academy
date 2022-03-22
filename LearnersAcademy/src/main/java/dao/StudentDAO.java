package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.Student;

public class StudentDAO {

	private final String QUERY = "select * from student";
	private Student student;
	private List<Student> studentList = new ArrayList<Student>();
	
	
	public List<Student> getStudentList(){
		try {
			Connection connection = DBConnectionProvider.getConnection();
			PreparedStatement statement = connection.prepareStatement(QUERY);
			
			ResultSet set = statement.executeQuery();
			while(set.next()) {
				student = new Student();
				student.setRollNo(set.getInt(1));
				student.setFirstName(set.getString(2));
				student.setLastName(set.getString(3));
				
				studentList.add(student);
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return studentList;
	}
}
