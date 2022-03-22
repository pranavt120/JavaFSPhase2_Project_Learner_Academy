package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AddStudentDAO {

	private final String INSERT = "insert into student (`First Name`,`Last Name`) values (?,?)";
	private int rowsaffected;
	private boolean isadded = true;
	
	public boolean addStudent(String firstName, String lastName) {
		try {
			Connection connection = DBConnectionProvider.getConnection();
			PreparedStatement statement = connection.prepareStatement(INSERT);
			
			statement.setString(1, firstName);
			statement.setString(2, lastName);
			
			rowsaffected = statement.executeUpdate();
			
			if(rowsaffected == 0) isadded = false;
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return isadded;
	}
}
