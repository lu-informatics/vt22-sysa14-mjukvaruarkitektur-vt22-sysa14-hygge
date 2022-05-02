package hygge.eao.ics;

import java.util.List;
import java.util.Set;

import javax.ejb.Local;

import hygge.ejb.ics.Education;
import hygge.ejb.ics.Industry;

@Local
public interface IndustryEAOLocal {

	public List<Industry> getAllIndustries();

	public Set<Education> getConnectedEducations(String industryName);

	public Industry findByIndustryName(String industryName);

	public Industry createIndustry(Industry industry);

	public Industry updateIndustry(Industry industry);

	public void deleteIndustry(String industryName);
}
