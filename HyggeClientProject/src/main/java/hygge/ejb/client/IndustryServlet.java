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
	// this variable is used to store request param "industry" for update
	Industry currentIndustry;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public IndustryServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Industry i;
		String name;
		String field;
		String url = null;
		// Get hidden field "operation" from jsp
		String operation = request.getParameter("operation");

		switch (operation) {

		case "createindustry":
			System.out.println("IndustryServlet-createindustry");
			name = request.getParameter("txtIndustryName");
			field = request.getParameter("txtField");
			i = new Industry();
			i.setIndustryName(name);
			i.setField(field);
			facade.createIndustry(i);
			request.setAttribute("industry", i);
			url = "/ShowIndustry.jsp";

		case "showindustry":
			System.out.println("IndustryServlet-showindustry");
			name = request.getParameter("txtIndustryName");
			i = facade.findByIndustryName(name);
			currentIndustry = i;
			request.setAttribute("industry", i);
			url = "/ShowIndustry.jsp";
			break;

		case "searchindustry":
			System.out.println("IndustryServlet-searchindustry");
			url = "/SearchIndustry.jsp";
			break;

		case "updateindustry":
			System.out.println("IndustryServlet-updateindustry");
			name = request.getParameter("txtIndustryName");
			field = request.getParameter("txtField");
			currentIndustry.setIndustryName(name);
			currentIndustry.setField(field);
			facade.updateIndustry(currentIndustry);

			request.setAttribute("industry", currentIndustry);
			url = "/ShowIndustry.jsp";
			break;

		case "deleteindustry":
			System.out.println("IndustryServlet-deleteindustry");
			if (currentIndustry != null) {
				facade.deleteIndustry(currentIndustry.getIndustryName());
				url = "/SearchIndustry.jsp";
			} else
				url = "/ShowIndustry.jsp";
			break;

		// default landing page
		default:
			url = "/SearchIndustry.jsp";
		}

		System.out.println(url);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}