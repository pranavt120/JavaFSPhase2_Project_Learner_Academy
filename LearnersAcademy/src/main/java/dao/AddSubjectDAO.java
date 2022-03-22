package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AddSubjectDAO {
	
	private final String QUERY = "insert into subjects (name) values (?)";
	int returnedRows = 0;
	boolean isadded = true;
	
	public boolean addSubject(String subjectName) {
		try {
			Connection connection = DBConnectionProvider.getConnection();
			PreparedStatement statement = connection.prepareStatement(QUERY);
			
			statement.setString(1, subjectName);
			
			returnedRows =  statement.executeUpdate();
			if(returnedRows == 0) isadded = false;
			return isadded;
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return false;
	}

}
