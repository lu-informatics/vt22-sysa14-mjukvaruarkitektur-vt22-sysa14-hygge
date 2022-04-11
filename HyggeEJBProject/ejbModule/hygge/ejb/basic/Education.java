package hygge.ejb.basic;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;

/**
 * Session Bean implementation class Education
 */
@Stateless
@LocalBean
public class Education implements EducationRemote, EducationLocal {

    /**
     * Default constructor. 
     */
    public Education() {
        // TODO Auto-generated constructor stub
    }

}
