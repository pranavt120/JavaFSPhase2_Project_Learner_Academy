package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.Teacher;

public class TeacherDAO {
	
	private final String QUERY = "select  teacher.`First Name`,teacher.`Last Name`, group_concat(distinct subjects.name) as Subjects from teacher\r\n"
			+ "inner join sub_teacher \r\n"
			+ "on teacher.id = sub_teacher.Teachers\r\n"
			+ "inner join subjects\r\n"
			+ "on subjects.id = sub_teacher.Subjects\r\n"
			+ "group by teacher.`First Name`";
	
	private Teacher teacher;
	private List<Teacher> teacherList = new ArrayList<Teacher>(); 
	
	public List<Teacher> getTeacherList(){
		try {
			Connection connection = DBConnectionProvider.getConnection();
			PreparedStatement statement = connection.prepareStatement(QUERY);
			
			ResultSet set = statement.executeQuery();
			while(set.next()) {
				teacher = new Teacher();
				teacher.setFirstName(set.getString(1));
				teacher.setLastName(set.getString(2));
				teacher.setSubjects(set.getString(3));
				
				teacherList.add(teacher);
			}
			return teacherList;
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}

}
