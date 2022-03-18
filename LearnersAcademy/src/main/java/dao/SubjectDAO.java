package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.Subject;
import beans.Teacher;

public class SubjectDAO {
	
	private final String SELECT = "select concat(teacher.`First Name`,\" \",teacher.`Last Name`), group_concat(distinct subjects.name) as Subjects from teacher inner join sub_teacher on teacher.id = sub_teacher.Teachers inner join subjects on subjects.id = sub_teacher.Subjects group by subjects.`Name`";
	private List<Subject> subjectList = new ArrayList<Subject>();
	private Subject subject;
	
	public List<Subject> getSubjectList(){
		try {
			Connection connection = DBConnectionProvider.getConnection();
			PreparedStatement statement = connection.prepareStatement(SELECT);
			
			ResultSet set = statement.executeQuery();
			
			while(set.next()) {
				subject = new Subject();
				subject.setTeacher(set.getString(1));
				subject.setName(set.getString(2));
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
