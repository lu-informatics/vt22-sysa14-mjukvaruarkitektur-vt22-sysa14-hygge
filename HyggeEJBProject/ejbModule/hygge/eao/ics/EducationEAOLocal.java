package hygge.eao.ics;

import java.util.List;
import java.util.Set;

import javax.ejb.Local;

import hygge.ejb.ics.Education;
import hygge.ejb.ics.Industry;

@Local
public interface EducationEAOLocal {

	public List<Education> getAllEducations();

	public Set<Industry> getConnectedIndustries(String educationName);

	public Education findByEducationName(String educationName);

	public Education createEducation(Education education);

	public Education updateEducation(Education education);

	public void deleteEducation(String educationName);
}
