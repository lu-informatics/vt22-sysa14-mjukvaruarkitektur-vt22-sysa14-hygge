package org.ics.ejb.test.restserver;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.ejb.EJB;
import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonArrayBuilder;
import javax.json.JsonObjectBuilder;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hygge.ejb.ics.Education;
import hygge.facade.ics.FacadeLocal;

/**
 * Servlet implementation class ServletRestTest
 */
@WebServlet("/ServletRestTest/*")
public class ServletRestTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB 
	   FacadeLocal facade;  
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletRestTest() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pathInfo = request.getPathInfo(); 
		 
		 if(pathInfo == null || pathInfo.equals("/")){ 
		    System.out.println("Alla"); 
		    System.out.println(pathInfo);
		   
			
		    List<Education> allEducations = facade.getAllEducations();
		    sendAsJson(response, allEducations); 
		  
		    return; 
		 } 
		 String[] splits = pathInfo.split("/"); 
		   
		 if(splits.length != 2) { 
		    System.out.println("Alla2"); 
		    response.sendError(HttpServletResponse.SC_BAD_REQUEST); 
		    return; 
		 } 
		   
		 String id = splits[1]; 
		Education education = facade.findByEducationName(id);
		 sendAsJson(response, education); 
		  
	; 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	private void sendAsJson(HttpServletResponse response, Education education) 
	           throws IOException { 
	            
	  PrintWriter out = response.getWriter(); 
	  response.setContentType("application/json"); 
	 
	  if (education != null) { 
	   out.print("{\"title\":"); 
	   out.print("\"" + education.getEducationName() + "\""); 
	   out.print(",\"Education name\":"); 
	   out.print("\"" +education.getLocale()+"\""); 
	   out.print(",\"locale\":"); 
	  } else { 
	   out.print("{ }"); 
	  } 
	  out.flush(); 
	 } 
	private void sendAsJson(HttpServletResponse response, List<Education> education) 
	           throws IOException { 
	       
	 PrintWriter out = response.getWriter(); 
	 response.setContentType("application/json"); 
	 
	 if (education != null) { 
	  JsonArrayBuilder array = Json.createArrayBuilder(); 
	  for (hygge.ejb.ics.Education e  : education) { 
	 
		  JsonObjectBuilder o = Json.createObjectBuilder(); 
	   o.add("educationName", String.valueOf(e.getEducationName())); 
	   o.add("locale", e.getLocale()); 
	   array.add(o); 
	  } 
	  JsonArray jsonArray = array.build(); 
	    
	  System.out.println("Education Rest: "+jsonArray); 
	  out.print(jsonArray); 
	 } else { 
	  out.print("[]"); 
	 } 
	 out.flush(); 
	} 

}
