package hygge.eao.ics;

import javax.ejb.Local;

import hygge.ejb.ics.Industry;

@Local
public interface IndustryEAOLocal {
	
	public Industry findByIndustryName(String industryName); 
	 public Industry createIndustry(Industry industry); 
	 public Industry updateIndustry(Industry industry); 
	 public void deleteIndustry(String industryName); 
	} 


