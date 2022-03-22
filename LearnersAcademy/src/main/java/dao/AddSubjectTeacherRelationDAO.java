package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import beans.Subject;

public class AddSubjectTeacherRelationDAO {
	
	private final String ADD="insert into sub_teacher (subjects,teachers) values (?,?)";
	private boolean isadded = true;
	private int rowsaffected;
	
	public boolean addSubjectTeacherRelation(int subjectId, int teacherId) {
		try {
			Connection connection = DBConnectionProvider.getConnection();
			PreparedStatement statement = connection.prepareStatement(ADD);
			
			statement.setInt(1, subjectId);
			statement.setInt(2, teacherId);
			
			rowsaffected = statement.executeUpdate();
			if(rowsaffected == 0) isadded = false;
			
		
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return isadded;
	}

}
