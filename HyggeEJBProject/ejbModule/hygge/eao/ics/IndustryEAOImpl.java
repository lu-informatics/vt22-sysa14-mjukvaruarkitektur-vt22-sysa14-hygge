package hygge.eao.ics;


import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import hygge.ejb.ics.Industry;

/**
 * Session Bean implementation class IndustryEAOImpl
 */
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
