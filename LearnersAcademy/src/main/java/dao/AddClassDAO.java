package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AddClassDAO {
	
	private final String ADD = "insert into classes (name) values (?)";
	private int rowsaffected = 0;
	private boolean isadded = true;
	
	public boolean addClass(String name) {
		try {
			Connection connection = DBConnectionProvider.getConnection();
			PreparedStatement statement = connection.prepareStatement(ADD);
			
			statement.setString(1, name);
			rowsaffected = statement.executeUpdate();
			
			if(rowsaffected == 0) isadded = false;
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return isadded;
	}

}