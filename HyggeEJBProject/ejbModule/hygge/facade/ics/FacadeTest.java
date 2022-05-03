package hygge.facade.ics;

import hygge.ejb.ics.Education;
import hygge.ejb.ics.Industry;
import junit.framework.TestCase;

public class FacadeTest extends TestCase {
		
	String expectedLocale; 
	String expectedEducationName;
	String expectedField;
	String expectedIndustryName; 
	
	Industry i1; 
	Industry i2;
	Education e1; 
	Education e2; 
	
	public FacadeTest(String name) {
		super(name);
	}

	protected void setUp() throws Exception {
		super.setUp();
		expectedLocale = "Lund University"; 
		expectedEducationName = "Medicine"; 
		expectedField = "Politician"; 
		expectedIndustryName = "Sales"; 
		
		Industry i1 = new Industry();
		i1.setIndustryName(expectedIndustryName);
		i1.setField(expectedField);
		Education e1 = new Education();
		e1.setEducationName(expectedEducationName);
		e1.setLocale(expectedLocale);
		i2.setIndustryName(""); = new Industry("Finance","Accountant");
		
				
	}

	protected void tearDown() throws Exception {
		super.tearDown();
		i1 = null;
		i2 = null;
		e1 = null; 
		e2 = null;
	}

	public void testGetLocale() {
		assertEquals(expectedLocale, e.getLocale());
		
	}
	
	public void testGetEducationName() {
		assertNotNull(e); 
		assertEquals(expectedEducationName, e.getEducationName());
	}
	
	public void testGetField() {
		assertEquals(expectedField, i.getField());
	}
	
	public void testGetIndustryName() {
		assertNotNull(i);
		assertEquals(expectedIndustryName, i.getIndustryName());
	}
	
	public void testSetIndustryName() {
		String expectedIndustryName2 = "Law";
		i.setIndustryName(expectedIndustryName2);
		assertEquals(expectedIndustryName2, i.getIndustryName());
	}
	
	public void testSetField() {
		String expectedField2 = "Consultant";
		i.setField(expectedField2);
		assertEquals(expectedField2, i.getField());
	}
	
	public void testSetEducationName() {
		String expectedEducationName2 = "Economics";
		e.setEducationName(expectedEducationName2);
		assertEquals(expectedEducationName2, e.getEducationName());
	}
	public void testSetLocale() {
		String expectedLocale2 = "Lund University";
		e.setLocale(expectedLocale2);
		assertEquals(expectedLocale2, e.getLocale());
	}
	
	public void testFindByIndustryName() {
		assertTrue(!);
	}

	public void testUpdateEducation() {
		fail("Not yet implemented");
	}

}
