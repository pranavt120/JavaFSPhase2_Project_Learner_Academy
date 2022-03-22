package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DeleteSubjectDAO {
	
	private final String  DELETE = "delete from subjects where id = ?";
	int rowsAffected = 0;
	private boolean isDeleted = true;
	
	public boolean deleteSubject(int id) {
			try {
				Connection connection = DBConnectionProvider.getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE);
				
				statement.setInt(1, id);
				
				rowsAffected = statement.executeUpdate();
				if(rowsAffected == 0) {
					isDeleted = false;
				}
				return isDeleted;
			}catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return isDeleted;
	}

}
