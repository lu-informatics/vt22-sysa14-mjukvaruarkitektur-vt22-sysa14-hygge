package hygge.facade.ics;

import java.util.List;
import java.util.Set;

import javax.ejb.EJB;
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

	@EJB
	private IndustryEAOLocal industryEAO;

	public Facade() {
	}

	public List<Industry> getAllIndustries() {
		return industryEAO.getAllIndustries();
	}

	public List<Education> getAllEducations() {
		return educationEAO.getAllEducations();
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

	/**
	 * Fetches a collection of industries from query, adds industry given by
	 * parameter, then assigns it to given education's collection. Finally, uses EAO
	 * to perform entity merge.
	 */
	public void connectEducationToIndustry(Industry industry, Education education) {
		Set<Industry> industrySet = fetchConnectedIndustries(education);
		industrySet.add(industry);
		education.setConnectedIndustries(industrySet);
		educationEAO.updateEducation(education);
	}

	/**
	 * works the same way as connectEducationToIndustry, but removes an industry
	 * instead of adding it.
	 */
	public void detachEducationFromIndustry(Industry industry, Education education) {
		Set<Industry> industrySet = fetchConnectedIndustries(education);
		industrySet.remove(industry);
		education.setConnectedIndustries(industrySet);
		educationEAO.updateEducation(education);
	}

	public Set<Industry> fetchConnectedIndustries(Education education) {
		return educationEAO.getConnectedIndustries(education.getEducationName());
	}

	public Set<Education> fetchConnectedEducations(Industry industry) {
		return industryEAO.getConnectedEducations(industry.getIndustryName());
	}

	public void deleteEducation(String educationName) {
		educationEAO.deleteEducation(educationName);
	}

	public void deleteIndustry(String industryName) {
		industryEAO.deleteIndustry(industryName);
	}
}