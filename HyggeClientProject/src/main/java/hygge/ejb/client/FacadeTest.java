package hygge.ejb.client;

import javax.naming.Context;
import javax.naming.InitialContext;

import hygge.facade.ics.FacadeLocal;
import junit.framework.TestCase;

public class FacadeTest extends TestCase {
	FacadeLocal facade;
	
	
	public FacadeTest(String name) {
		super(name);
	}

	protected void setUp() throws Exception {
		super.setUp();
		Context context = new InitialContext();
		facade = (FacadeLocal)context.lookup("java:app/HyggeEJBProject/Facade!hygge.facade.ics.FacadeLocal");
		
	}

	protected void tearDown() throws Exception {
		super.tearDown();
		facade = null;
	}

	public void testFindByEducationName() {
		assertEquals(facade.findByEducationName("LTH").getLocale(),"Lund");
	}

	public void testDeleteEducation() {
		fail("Not yet implemented");
	}

}
