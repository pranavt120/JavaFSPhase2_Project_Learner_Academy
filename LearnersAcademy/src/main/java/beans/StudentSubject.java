package beans;

import java.util.List;

public class StudentSubject {

	private String firstName;
	private String lastName;
	private String subjects;
	
	public StudentSubject(){}
	
	public String getFirstName() {
		return firstName;
	}
	public String getSubjects() {
		return subjects;
	}

	public void setSubjects(String subjects) {
		this.subjects = subjects;
	}

	@Override
	public String toString() {
		return "Student [firstName=" + firstName + ", lastName=" + lastName + ", subjects=" + subjects + "]";
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	
	
	
}
