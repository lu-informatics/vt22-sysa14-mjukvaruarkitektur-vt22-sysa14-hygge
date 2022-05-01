package hygge.facade.ics;

import java.util.List;
import java.util.Set;

import javax.ejb.Local;

import hygge.ejb.ics.Education;
import hygge.ejb.ics.Industry;

@Local
public interface FacadeLocal {

	public List<Education> getAllEducations();
	public List<Industry> getAllIndustries();

	public Education findByEducationName(String educationName);
	public Industry findByIndustryName(String industryName);

	public Education createEducation(Education education);
	public Industry createIndustry(Industry industry);

	public Education updateEducation(Education education);
	public Industry updateIndustry(Industry industry);

	public void deleteEducation(String educationName);
	public void deleteIndustry(String industryName);
	
	public void connectEducationToIndustry(Industry industry,Education education);
	public void detachEducationFromIndustry(Industry industry,Education education);
	
	public Set<Industry> fetchConnectedIndustries(Education education);
	public Set<Education> fetchConnectedEducations(Industry industry);
}
