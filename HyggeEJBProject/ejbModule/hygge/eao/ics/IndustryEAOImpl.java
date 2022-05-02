package hygge.eao.ics;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import hygge.ejb.ics.Education;
import hygge.ejb.ics.Industry;

/**
 * Session Bean implementation class IndustryEAOImpl
 */

@Stateless
public class IndustryEAOImpl implements IndustryEAOLocal {

	@PersistenceContext(unitName = "HyggeEJBSql")
	private EntityManager em;

	public IndustryEAOImpl() {
	}

	@SuppressWarnings("unchecked")
	public ArrayList<Industry> getAllIndustries() {
		return (ArrayList<Industry>) em.createQuery("select i from Industry i").getResultList();
	}

	/**
	 * Fetches a list of educationNames from native named query defined in
	 * Industry.java, then fills a set of Educations with a loop by using the names
	 * via em.find
	 */
	public Set<Education> getConnectedEducations(String industryName) {
		Set<Education> connectedEducations = new HashSet<>();
		Query q = em.createNamedQuery("selectConnectedEducations");
		q.setParameter(1, industryName);
		for (Object name : q.getResultList())
			connectedEducations.add(em.find(Education.class, (String) name));
		return connectedEducations;
	}

	public Industry findByIndustryName(String industryName) {
		return em.find(Industry.class, industryName);
	}

	public Industry createIndustry(Industry industry) {
		em.persist(industry);
		return industry;
	}

	public Industry updateIndustry(Industry industry) {
		em.merge(industry);
		return industry;
	}

	public void deleteIndustry(String industryName) {
		Industry i = this.findByIndustryName(industryName);
		if (i != null) {
			em.remove(i);
		}
	}

}
