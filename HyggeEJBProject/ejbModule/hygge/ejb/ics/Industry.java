package hygge.ejb.ics;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.NamedNativeQuery;
import javax.persistence.Table;

@NamedNativeQuery(name = "selectConnectedEducations", query = "SELECT ei.educationName FROM EducationIndustry ei WHERE ei.industryName=?1")

@Entity
@Table(name = "Industry")
public class Industry implements Serializable {

	private static final long serialVersionUID = 1L;
	private String industryName;
	Set<Education> connectedEducations;
	private String field;


	@Id
	@Column(name = "industryName")
	public String getIndustryName() {
		return industryName;
	}

	public void setIndustryName(String industryName) {
		this.industryName = industryName;
	}

	@Column(name = "field")
	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}

	@ManyToMany(mappedBy = "connectedIndustries")
	public Set<Education> getConnectedEducations() {
		return connectedEducations;
	}

	public void setConnectedEducations(Set<Education> connectedEducations) {
		this.connectedEducations = connectedEducations;
	}

}
