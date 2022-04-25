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
 * Servlet implementation class HyggeRestClient
 */
@WebServlet("/HyggeRestClient")
public class HyggeRestClient extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@EJB
	FacadeLocal facade;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HyggeRestClient() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

		String id = splits[1];
		Education education = facade.findByEducationName(id);
		sendEducationAsJson(response, education);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
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
