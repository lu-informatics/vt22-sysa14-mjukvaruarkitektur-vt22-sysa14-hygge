package hygge.ejb.ics;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Education")
public class Education implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String educationName;
	private String locale;
	
	@Id
	@Column(name = "educationName")
	public String getEducationName() {
		return educationName;
	}
	
	public void setEducationName(String educationName) {
		this.educationName = educationName;
	}
	
	@Column(name = "locale")
	public String getLocale() {
		return locale;
	}
	
	public void setLocale(String locale) {
		this.locale = locale;
	}
}
