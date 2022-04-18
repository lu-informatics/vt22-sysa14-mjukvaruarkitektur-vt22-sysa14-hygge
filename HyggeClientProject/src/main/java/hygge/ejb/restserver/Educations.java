package hygge.ejb.restserver;

import java.io.IOException;
import java.io.PrintWriter;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hygge.ejb.ics.Education;
import hygge.facade.ics.FacadeLocal;

/**
 * Servlet implementation class Educations
 */
@WebServlet("/Educations/*")
public class Educations extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB
	FacadeLocal facade;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Educations() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String pathInfo = request.getPathInfo();
		if (pathInfo == null || pathInfo.equals("/")) {
			System.out.println("All");
			System.out.println(pathInfo);
			return;
		}
		String[] splits = pathInfo.split("/");
		if (splits.length != 2) {
			System.out.println("All2");
			response.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return;
		}

		String id = splits[1];
		Education education = facade.findByEducationName(id);
		sendEducationAsJson(response, education);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	private void sendEducationAsJson(HttpServletResponse response, Education education) throws IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("application/json");
		if (education != null) {
			out.print("{\"name\":");
			out.print("\"" + education.getEducationName() + "\"");
			out.print(",\"locale\":");
			out.print("\"" + education.getLocale() + "\"}");
		} else
			out.print("{}");
		out.flush();
	}
}
