package org.ics.ejb.restHygge;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.ejb.EJB;
import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonArrayBuilder;
import javax.json.JsonObject;
import javax.json.JsonObjectBuilder;
import javax.json.JsonReader;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hygge.facade.ics.FacadeLocal;
import hygge.ejb.ics.*;


/**
 * Servlet implementation class HyggeRestServlet2
 */
@WebServlet("/HyggeRestServlet2/*")
public class HyggeRestServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@EJB 
	private FacadeLocal facade;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HyggeRestServlet2() {
      
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String pathInfo = request.getPathInfo();
		if(pathInfo == null || pathInfo.equals("/")){
		 System.out.println("Alla");
		 System.out.println(pathInfo);
		
		 List<Education> allEducation = facade.getAllEducations();
		 sendAsJson(response, allEducation);
		 return;
		 
		}
		String[] splits = pathInfo.split("/");
		if(splits.length != 2) {
		 System.out.println("Alla2");
		 response.sendError(HttpServletResponse.SC_BAD_REQUEST);
		 return;
		}
		String id = splits[1];
		Education education = facade.findByEducationName((id));
		sendAsJson(response, education);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//	doGet(request, response);
		String pathInfo = request.getPathInfo();
		if(pathInfo == null || pathInfo.equals("/")){
		BufferedReader reader = request.getReader();//Läs data Json

		Education education = parseJsonEducation(reader);

		try {
			facade.createEducation(education);
		}catch(Exception e) {
		 System.out.println("duplicate key" + e.getMessage());
		}
		sendAsJson(response, education);
		}
	}

	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pathInfo = request.getPathInfo();
		if(pathInfo == null || pathInfo.equals("/")){
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
		return;
		}
		String[] splits = pathInfo.split("/");
		if(splits.length != 2) {
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
		return;
		}
		String id = splits[1];
		BufferedReader reader = request.getReader();

		Education education = parseJsonEducation(reader);
		//Uppdatera i db
		try {
		 education = facade.updateEducation(education);
		}catch(Exception e) {
		 System.out.println("facade Update Error");
		}
		sendAsJson(response, education);

	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	/*protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pathInfo = request.getPathInfo();
		if(pathInfo == null || pathInfo.equals("/")){
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
		return;
		}
		String[] splits = pathInfo.split("/");
		if(splits.length != 2) {
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
		return;
		}
		String id = splits[1];
		Movie movie = facade.findByMovieId(Integer.parseInt(id));
		if (movie != null) {
		facade.deleteMovie(Integer.parseInt(id));
		}
		sendAsJson(response, movie);
		
	}
	*/
	private void sendAsJson(HttpServletResponse response, Education education)
			 throws IOException {

			PrintWriter out = response.getWriter();
			response.setContentType("application/json");
			if (education != null) {
			out.print("{\"educationName\":");
			out.print("\"" + education.getEducationName() + "\"");
			out.print(",\"locale\":");
			out.print("\"" +education.getLocale()+"\"");
			
			} else {
			out.print("{ }");
			}
			out.flush();
			}
	private void sendAsJson(HttpServletResponse response, List<Education> allEducations)
			 throws IOException {

			PrintWriter out = response.getWriter();
			response.setContentType("application/json");
			if (allEducations != null) {
			JsonArrayBuilder array = Json.createArrayBuilder();
			for (Education education : allEducations) {
			JsonObjectBuilder o = Json.createObjectBuilder();
			o.add("educationName", String.valueOf(education.getEducationName()));
			o.add("locale", education.getLocale());
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
	private Education parseJsonEducation(BufferedReader br) {
		 //javax.json-1.0.4.jar
		 JsonReader jsonReader = null;
		 JsonObject jsonRoot = null;
		 jsonReader = Json.createReader(br);
		 jsonRoot = jsonReader.readObject();
		 System.out.println("JsonRoot: "+jsonRoot);
		Education education = new Education();
		 education.setEducationName(jsonRoot.getString("educationName"));
		 education.setLocale (jsonRoot.getString("locale"));

		 return education;
		}
}
