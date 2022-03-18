package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.ClassReport;

public class ClassDetailsDAO {
	
	public final String QUERY = "select class,subject_name, teacher_name from Class_Report where class= ? group by subject_name,teacher_name";
	
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
				classReport.setName(set.getString(1));
				classReport.setTeacher(set.getString(3));
				classReport.setSubject(set.getString(2));
				
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
