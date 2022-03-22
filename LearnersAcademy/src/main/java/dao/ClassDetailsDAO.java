package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.ClassReport;

public class ClassDetailsDAO {
	
	public final String QUERY = "select teacher_id, teacherName, class_id, class, subject_id, subject_name from class_report_2 where class = ? group by teacherName, subject_name ";
	
	private List<ClassReport> classReportList = new ArrayList<ClassReport>();
	private ClassReport classReport;
	
	
	public List<ClassReport> getClassReport(String className){
		try {
			Connection connection = DBConnectionProvider.getConnection();
			PreparedStatement statement = connection.prepareStatement(QUERY);
			
			statement.setString(1, className);
			
			ResultSet set = statement.executeQuery();
			while(set.next()) {
				classReport = new ClassReport();
				classReport.setTeacherId(set.getInt(1));
				classReport.setTeacher(set.getString(2));
				classReport.setClassId(set.getInt(3));
				classReport.setName(set.getString(4));
				classReport.setSubjectId(set.getInt(5));
				classReport.setSubject(set.getString(6));
				
				classReportList.add(classReport);
			}
			return classReportList;
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}

}
