package hygge.facade.ics;

import hygge.ejb.ics.Education;
import hygge.ejb.ics.Industry;
import junit.framework.TestCase;

public class FacadeTest extends TestCase {
		
	String expectedLocale; 
	String expectedEducationName;
	String expectedField;
	String expectedIndustryName; 
	
	Industry i; 
	Education e; 
	
	public FacadeTest(String name) {
		super(name);
	}

	protected void setUp() throws Exception {
		super.setUp();
		expectedLocale = "Lund University"; 
		expectedEducationName = "Medicine"; 
		expectedField = "Politician"; 
		expectedIndustryName = "Sales"; 
		
		Industry i = new Industry();
		i.setIndustryName(expectedIndustryName);
		i.setField(expectedField);
		Education e = new Education();
		e.setEducationName(expectedEducationName);
		e.setLocale(expectedLocale);
				
	}

	protected void tearDown() throws Exception {
		super.tearDown();
		i = null;
		e = null; 
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
		
	}

	public void testUpdateEducation() {
		fail("Not yet implemented");
	}

}
