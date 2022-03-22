package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.Subject;

public class SubjectDAO {
	
	private final String QUERY = "select * from subjects";
	private List<Subject> subjectList = new ArrayList<Subject>();
	private Subject subject;
	
	public List<Subject> getSubjectList(){
		try {
			Connection connection = DBConnectionProvider.getConnection();
			PreparedStatement statement = connection.prepareStatement(QUERY);
			
			ResultSet set = statement.executeQuery();
			while(set.next()) {
				subject = new Subject();
				subject.setName(set.getString(2));
				subject.setId(set.getInt(1));
				
				subjectList.add(subject);
			}
			return subjectList;
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}

}
