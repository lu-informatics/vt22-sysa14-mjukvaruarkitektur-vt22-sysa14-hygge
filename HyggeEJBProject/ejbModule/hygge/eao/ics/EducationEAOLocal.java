package hygge.eao.ics;

import javax.ejb.Local;

import hygge.ejb.ics.Education;

@Local
public interface EducationEAOLocal {
	
	public Education findByEducationName(String educationName); 
	 public Education createEducation(Education education); 
	 public Education updateEducation(Education education); 
	 public void deleteEducation(String educationName); 
	} 


