package hygge.ejb.restserver;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serializable;

import javax.ejb.EJB;
import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hygge.ejb.ics.Education;
import hygge.ejb.ics.Industry;
import hygge.facade.ics.FacadeLocal;

/**
 * Servlet implementation class HyggeRestClient
 */
@WebServlet("/HyggeRestClient")
public class HyggeRestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB
	FacadeLocal facade;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public HyggeRestServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pathInfo = request.getPathInfo();
		if (pathInfo == null || pathInfo.equals("/")) {
			System.out.println("All");
			System.out.println(pathInfo);
			return;
		}
		String[] splits = pathInfo.split("/");
		if (splits.length != 3) {
			System.out.println("All2");
			response.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return;
		}

		String entityType = splits[1];
		String id = splits[2];

		if (entityType.equals("Industry")) {
			Industry industry = facade.findByIndustryName(id);
			sendAsJson(response, industry);

		} else {
			Education education = facade.findByEducationName(id);
			sendAsJson(response, education);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pathInfo = request.getPathInfo();
		if (pathInfo == null || pathInfo.equals("/")) {

			BufferedReader reader = request.getReader();
			String entityType = request.getParameter("entityType");
			try {
				if (entityType.equals("Industry")) {
					Industry i = (Industry) parseJsonEntity(reader, entityType);
					i = facade.createIndustry(i);
					sendAsJson(response, i);
				} else {
					Education e = (Education) parseJsonEntity(reader, entityType);
					e = facade.createEducation(e);
					sendAsJson(response, e);
				}
			} catch (Exception e) {
				System.out.println("duplicate key violation!");
			}
		}
	}

	protected void doPut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pathInfo = request.getPathInfo();

		if (pathInfo == null || pathInfo.equals("/")) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return;
		}

		String[] splits = pathInfo.split("/");
		if (splits.length != 3) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return;
		}
		String entityType = splits[1];
		// String id = splits[2];

		BufferedReader reader = request.getReader();

		try {
			if (entityType.equals("Industry")) {
				Industry i = (Industry) parseJsonEntity(reader, entityType);
				i = facade.updateIndustry(i);
				sendAsJson(response, i);
			} else {
				Education e = (Education) parseJsonEntity(reader, entityType);
				e = facade.updateEducation(e);
				sendAsJson(response, e);
			}
		} catch (Exception e) {
			System.out.println("facade Update Error");
		}
	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pathInfo = request.getPathInfo();

		if (pathInfo == null || pathInfo.equals("/")) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return;
		}

		String[] splits = pathInfo.split("/");

		if (splits.length != 3) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return;
		}
		String entityType = splits[1];
		String id = splits[2];

		if (entityType.toLowerCase().equals("industry")) {
			Industry industry = facade.findByIndustryName(id);
			if (industry != null)
				facade.deleteIndustry(id);
			sendAsJson(response, industry);
		} else {
			Education education = facade.findByEducationName(id);
			if (education != null)
				facade.deleteEducation(id);
			sendAsJson(response, education);
		}
	}

	private void sendAsJson(HttpServletResponse response, Serializable entity) throws IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("application/json");

		if (entity != null) {
			out.print("{\"name\":");
			if (entity instanceof Industry) {
				out.print("\"" + ((Industry) entity).getIndustryName() + "\"");
				out.print(",\"locale\":");
				out.print("\"" + ((Industry) entity).getField() + "\"}");
			} else {
				out.print("{\"name\":");
				out.print("\"" + ((Education) entity).getEducationName() + "\"");
				out.print(",\"locale\":");
				out.print("\"" + ((Education) entity).getLocale() + "\"}");
			}
		} else
			out.print("{}");
		out.flush();
	}

	private Serializable parseJsonEntity(BufferedReader br, String entityType) {
		// javax.json-1.0.4.jar
		JsonReader jsonReader = null;
		JsonObject jsonRoot = null;

		jsonReader = Json.createReader(br);
		jsonRoot = jsonReader.readObject();

		System.out.println("JsonRoot: " + jsonRoot);

		if (entityType.equals("Industry")) {
			Industry industry = new Industry();
			industry.setIndustryName(jsonRoot.getString("name"));
			industry.setField(jsonRoot.getString("field"));
			return industry;
		}
		Education education = new Education();
		education.setEducationName(jsonRoot.getString("name"));
		education.setLocale(jsonRoot.getString("locale"));
		return education;
	}
}
