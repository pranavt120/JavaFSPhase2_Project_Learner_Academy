package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.StudentSubject;

public class StudentSubjectDAO {
	
	final String SELECT = "select student.`First Name`, student.`Last Name`, group_concat(subjects.`Name`) as Subjects  from student inner join studentsubjectrelation as relation on student.rollNo = relation.Student inner join subjects on subjects.id = relation.Subject group by student.`First Name`";
	private StudentSubject student;
	private List<StudentSubject> studentList = new ArrayList<>();
	
	public List<StudentSubject> getStudentList(){
		try {
			Connection connection = DBConnectionProvider.getConnection();
			PreparedStatement statement = connection.prepareStatement(SELECT);
			
			ResultSet set = statement.executeQuery();
			while(set.next()) {
				student = new StudentSubject();
				student.setFirstName(set.getString(1));
				student.setLastName(set.getString(2));
				student.setSubjects(set.getString(3));
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
