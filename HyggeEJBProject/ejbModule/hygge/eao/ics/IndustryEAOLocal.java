package hygge.eao.ics;

import java.util.List;

import javax.ejb.Local;

import hygge.ejb.ics.Industry;

@Local
public interface IndustryEAOLocal {

	public List<Industry> getAllIndustries();
	
	public Industry findByIndustryName(String industryName);

	public Industry createIndustry(Industry industry);

	public Industry updateIndustry(Industry industry);

	public void deleteIndustry(String industryName);
}
