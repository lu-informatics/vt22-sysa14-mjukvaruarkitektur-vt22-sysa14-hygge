package hygge.ejb.ics;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.NamedNativeQuery;
import javax.persistence.Table;

@NamedNativeQuery(name = "selectConnectedIndustries", query = "SELECT ei.industryName FROM EducationIndustry ei WHERE ei.educationName=?1")

@Entity
@Table(name = "Education")
public class Education implements Serializable {

	private static final long serialVersionUID = 1L;
	private String educationName;
	Set<Industry> connectedIndustries;
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

	@ManyToMany
	@JoinTable(name = "EducationIndustry", joinColumns = @JoinColumn(name = "educationName"), inverseJoinColumns = @JoinColumn(name = "industryName"))
	public Set<Industry> getConnectedIndustries() {
		return connectedIndustries;
	}

	public void setConnectedIndustries(Set<Industry> connectedIndustries) {
		this.connectedIndustries = connectedIndustries;
	}
	
	public boolean Equals(Education other) {
		return (educationName.equals(other.getEducationName())&&locale.equals(other.getLocale()));
	}

}
