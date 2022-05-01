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
 * Session Bean implementation class HyggeEAOImpl
 */


@Stateless
//@LocalBean
public class EducationEAOImpl implements EducationEAOLocal {

	@PersistenceContext(unitName = "HyggeEJBSql")
	private EntityManager em;

	/**
	 * Default constructor.
	 */
	public EducationEAOImpl() {
		// TODO Auto-generated constructor stub
	}

	@SuppressWarnings("unchecked")
	public ArrayList<Education> getAllEducations() {
		return (ArrayList<Education>) em.createQuery("select e from Education e").getResultList();
	}

	@SuppressWarnings("unchecked")
	public Set<Industry> getConnectedIndustries(String educationName) {
		Set<Industry> connectedIndustries = new HashSet<>();
		Query q = em.createNamedQuery("selectConnectedIndustries");
		q.setParameter(1, educationName);
		connectedIndustries.addAll(q.getResultList());
		return connectedIndustries;
	}

	public Education findByEducationName(String educationName) {
		return em.find(Education.class, educationName);
	}

	public Education createEducation(Education education) {
		em.persist(education);
		return education;
	}

	public Education updateEducation(Education education) {
		em.merge(education);
		return education;
	}

	public void deleteEducation(String educationName) {
		Education e = this.findByEducationName(educationName);
		if (e != null) {
			em.remove(e);
		}
	}
}
