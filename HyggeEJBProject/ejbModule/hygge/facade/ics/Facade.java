package hygge.facade.ics;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import hygge.eao.ics.EducationEAOLocal;
import hygge.eao.ics.IndustryEAOLocal;
import hygge.ejb.ics.Education;
import hygge.ejb.ics.Industry;

/**
 * Session Bean implementation class Facade
 */
@Stateless
public class Facade implements FacadeLocal {

	@EJB
	private EducationEAOLocal educationEAO;
	private IndustryEAOLocal industryEAO;



	/**
	 * Default constructor. 
	 */
	public Facade() {
		// TODO Auto-generated constructor stub
	}

	public Education findByEducationName(String educationName) {
		return educationEAO.findByEducationName(educationName);

	}

	public Industry findByIndustryName(String industryName) {
		return industryEAO.findByIndustryName(industryName);

	}

	public Education createEducation(Education education) {
		return educationEAO.createEducation(education);
	}

	public Industry createIndustry(Industry industry) {
		return industryEAO.createIndustry(industry);
	}


	public Education updateEducation(Education education) {
		return educationEAO.updateEducation(education);
	}

	public Industry updateIndustry(Industry industry) {
		return industryEAO.updateIndustry(industry);
	}

	public void deleteEducation(String educationName) {
		educationEAO.deleteEducation(educationName);
	}

	public void deleteIndustry(String industryName) {
		industryEAO.deleteIndustry(industryName);
	}
}

