package hygge.eao.ics;

import java.util.List;

import javax.ejb.Local;

import hygge.ejb.ics.Education;

@Local
public interface EducationEAOLocal {
	
	public List<Education> getAllEducations();

	public Education findByEducationName(String educationName);

	public Education createEducation(Education education);

	public Education updateEducation(Education education);

	public void deleteEducation(String educationName);
}
