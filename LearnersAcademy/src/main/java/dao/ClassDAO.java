package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.Class;

public class ClassDAO {
	
	private final String QUERY = "Select * from classes";
	private Class cls;
	private List<Class> classList = new ArrayList<Class>();
	
	public List<Class> getClassList(){
		
		
		try {
			Connection connection = DBConnectionProvider.getConnection();
			PreparedStatement statement = connection.prepareStatement(QUERY);
			
			ResultSet set = statement.executeQuery();
			while(set.next()) {
				cls = new Class();
				cls.setName(set.getString(2));
				cls.setId(set.getInt(1));
				
				classList.add(cls);
			}
			return classList;
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}

}
