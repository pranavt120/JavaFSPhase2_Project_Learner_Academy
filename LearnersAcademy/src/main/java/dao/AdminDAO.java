package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDAO {

	
	public boolean validateAdmin(String email, String password) {
		final String SELECT = "select * from admin_credentials where email=? and password=?";
		
		try {
			Connection connection = DBConnectionProvider.getConnection();
			PreparedStatement statement = connection.prepareStatement(SELECT);
			statement.setString(1, email);
			statement.setString(2, password);
			
			ResultSet set = statement.executeQuery();
			
			if(set.next()) {
				return true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
		
	}

}
