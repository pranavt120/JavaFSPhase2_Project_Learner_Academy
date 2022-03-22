package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.SubjectTeacher;
import beans.Teacher;

public class TeacherDAO {
	
	private final String QUERY = "select * from teacher";
	
	private Teacher teacher;
	private List<Teacher> teacherList = new ArrayList<Teacher>(); 
	
	public List<Teacher> getTeacherList(){
		try {
			Connection connection = DBConnectionProvider.getConnection();
			PreparedStatement statement = connection.prepareStatement(QUERY);
			
			ResultSet set = statement.executeQuery();
			while(set.next()) {
				teacher = new Teacher();
				teacher.setId(set.getInt(1));
				teacher.setFirstName(set.getString(2));
				teacher.setLastName(set.getString(3));
				
				teacherList.add(teacher);
			}
			return teacherList;
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}

}
