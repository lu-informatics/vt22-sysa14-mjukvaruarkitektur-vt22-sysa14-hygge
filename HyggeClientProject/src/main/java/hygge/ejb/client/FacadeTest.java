package hygge.ejb.client;

import javax.naming.Context;
import javax.naming.InitialContext;

import hygge.ejb.ics.Education;
import hygge.facade.ics.FacadeLocal;
import junit.framework.TestCase;

public class FacadeTest extends TestCase {
	FacadeLocal facade;
	String expectedName, expectedLocale;
	Education testEducation;

	public FacadeTest(String name) {
		super(name);
	}

	protected void setUp() throws Exception {
		super.setUp();
		Context context = new InitialContext();
		facade = (FacadeLocal) context.lookup("java:app/HyggeEJBProject/Facade!hygge.facade.ics.FacadeLocal");
		testEducation = new Education();

		expectedName = "testLTH";
		expectedLocale = "testLund";

		testEducation.setEducationName(expectedName);
		testEducation.setLocale(expectedLocale);

		facade.createEducation(testEducation);
	}

	protected void tearDown() throws Exception {
		super.tearDown();
		facade.deleteEducation("testLTH");
		facade = null;
		testEducation = null;
		expectedName = null;
		expectedLocale = null;
	}

	public void testFindByEducationName() {
		assertTrue(facade.findByEducationName(expectedName).Equals(testEducation));
	}

	public void testUpdateEducation() {
		testEducation.setLocale("testHelsingborg");
		facade.updateEducation(testEducation);
		assertEquals(facade.findByEducationName("testLTH").getLocale(), "testHelsingborg");
	}
}
