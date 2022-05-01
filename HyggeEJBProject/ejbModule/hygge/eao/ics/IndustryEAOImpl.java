package hygge.eao.ics;



import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NamedNativeQuery;
import javax.persistence.PersistenceContext;

import hygge.ejb.ics.Education;
import hygge.ejb.ics.Industry;

/**
 * Session Bean implementation class IndustryEAOImpl
 */
@NamedNativeQuery(name = "selectConnectedEducations", query="SELECT ei.educationName FROM EducationIndustry ei WHERE ei.industryName=?")

@Stateless
//@LocalBean
public class IndustryEAOImpl implements IndustryEAOLocal {
	
	@PersistenceContext(unitName="HyggeEJBSql") 
	 private EntityManager em;

    /**
     * Default constructor. 
     */
    public IndustryEAOImpl() {
        // TODO Auto-generated constructor stub
    }
    
    @SuppressWarnings("unchecked")
	public ArrayList<Industry> getAllIndustries(){
    	return (ArrayList<Industry>)em.createQuery("select i from Industry i").getResultList();
    }
    
    @SuppressWarnings("unchecked")
	public Set<Education> getConnectedEducations(String industryName){
    	Set<Education> connectedEducations = new HashSet<>();
    	connectedEducations.addAll(em.createNamedQuery("selectConnectedEducations").getResultList());
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
