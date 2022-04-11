package hygge.ejb.ics;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "Industry")
public class Industry implements Serializable {
	
	private String industryName;
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
	

	

}
