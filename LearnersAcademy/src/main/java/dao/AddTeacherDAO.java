package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class AddTeacherDAO {
	
	private final String ADD = "insert into teacher (`First Name`, `Last Name`) values (?,?)";
	private int rowsAffected = 0;
	private boolean isadded = true;
	
	public boolean addTeacher(String firstName,String lastName) {
		try {
			Connection connection = DBConnectionProvider.getConnection();
			PreparedStatement statement = connection.prepareStatement(ADD);
			
			statement.setString(1, firstName);
			statement.setString(2, lastName);
			
			rowsAffected = statement.executeUpdate();
			if(rowsAffected == 0) isadded = false;
			
			return isadded;
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return isadded;
	}

}
