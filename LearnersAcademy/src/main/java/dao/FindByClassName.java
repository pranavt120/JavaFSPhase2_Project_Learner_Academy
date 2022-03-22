package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class FindByClassName {
	
	private final String FIND = "select * from classes where name= ?";
	private int id;
	
	public int findClassIdByName(String name) {
		try {
			Connection connection = DBConnectionProvider.getConnection();
			PreparedStatement statement = connection.prepareStatement(FIND);
			
			
			statement.setString(1, name);
			ResultSet set = statement.executeQuery();
			
			while(set.next()) {
				id = set.getInt(1);
			}
			
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return id;
	}

}
