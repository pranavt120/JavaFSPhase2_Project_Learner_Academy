package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.Subject;
import beans.SubjectTeacher;
import beans.Teacher;

public class SubjectTeacherDAO {
	
	private final String SELECT = "select Teacher.id as Teacher_id, concat(teacher.`First Name`,\" \",teacher.`Last Name`) as Teacher, subjects.id as Subject_id, (subjects.name) as Subjects from teacher inner join sub_teacher on teacher.id = sub_teacher.Teachers inner join subjects on subjects.id = sub_teacher.Subjects  where subjects.id = ?";
	private List<SubjectTeacher> subjectList = new ArrayList<SubjectTeacher>();
	private SubjectTeacher subject;
	
	public List<SubjectTeacher> getSubjectList(Subject sub){
		try {
			Connection connection = DBConnectionProvider.getConnection();
			PreparedStatement statement = connection.prepareStatement(SELECT);
			
			statement.setInt(1, sub.getId());
			
			ResultSet set = statement.executeQuery();
			
			while(set.next()) {
				subject = new SubjectTeacher();
				subject.setTeacherId(set.getInt(1));
				subject.setTeacher(set.getString(2));
				subject.setSubjectId(set.getInt(3));
				subject.setName(set.getString(4));
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
