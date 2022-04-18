package hygge.ejb.client;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hygge.ejb.ics.Industry;
import hygge.facade.ics.FacadeLocal;

/**
 * Servlet implementation class IndustryServlet
 */
@WebServlet("/IndustryServlet")
public class IndustryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB
	FacadeLocal facade;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public IndustryServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = null;

		// Get hidden field
		String operation = request.getParameter("operation");

		switch (operation) {

		case "showindustry":
			System.out.println("IndustryServlet-showindustry");
			String name = request.getParameter("txtIndustryName");
			Industry i = facade.findByIndustryName(name);
			request.setAttribute("industry", i);
			url = "/ShowIndustry.jsp";
			break;

		case "searchindustry":
			System.out.println("IndustryServlet-searchindustry");
			url = "/SearchIndustry.jsp";
			break;

		default: // default landing page
			url = "/SearchIndustry.jsp";
		}

		System.out.println(url);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
