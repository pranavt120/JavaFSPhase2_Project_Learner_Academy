package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.Subject;

public class SubjectsForTeacherDAO {
	
	private final String FIND = "select subjects.id,subjects.name as subjects from sub_teacher \r\n"
			+ "join teacher on teacher.id = sub_teacher.teachers\r\n"
			+ "join subjects on subjects.id = sub_teacher.subjects\r\n"
			+ "where teacher.id = ?";
	
	private Subject subject;
	private List<Subject> subjectList = new ArrayList<>();
	
	public List<Subject> getSubjectsForTeacher(int teacherId){
		try {
			Connection connection = DBConnectionProvider.getConnection();
			PreparedStatement statement = connection.prepareStatement(FIND);
			
			statement.setInt(1, teacherId);
			
			ResultSet set = statement.executeQuery();
			while(set.next()) {
				subject = new Subject();
				subject.setId(set.getInt(1));
				subject.setName(set.getString(2));
				
				subjectList.add(subject);
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return subjectList;
	}

}
