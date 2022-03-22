package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DeleteClassDAO {
	
	private final String DELETE = "delete from classes where id = ?";
	int rowsaffected;
	boolean isdeleted=true;
	
	public boolean deleteClass(int id) {
		try {
			Connection connection = DBConnectionProvider.getConnection();
			PreparedStatement statement = connection.prepareStatement(DELETE);
			
			statement.setInt(1, id);
			
			rowsaffected = statement.executeUpdate();
			
			if(rowsaffected == 0) isdeleted = false;
			
			
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return isdeleted;
	}

}
