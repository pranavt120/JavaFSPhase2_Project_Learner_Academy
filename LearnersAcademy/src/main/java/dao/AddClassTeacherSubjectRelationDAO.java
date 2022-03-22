package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AddClassTeacherSubjectRelationDAO {
	
	private final String ADD = "insert into class_subject_teacher_relation (subject,teacher,class) values (?,?,?)";
	private int rowsaffected;
	private boolean isadded = true;
	
	
	public boolean addRelation(int teacherId, int subjectId, int classId) {
		try {
			Connection connection = DBConnectionProvider.getConnection();
			PreparedStatement statement = connection.prepareStatement(ADD);
			
			
			statement.setInt(1, subjectId);
			statement.setInt(2, teacherId);
			statement.setInt(3, classId);
			
			rowsaffected = statement.executeUpdate();
			if(rowsaffected == 0) isadded = false;
			
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return isadded;
	}
}
