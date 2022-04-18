package hygge.ejb.client;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hygge.ejb.ics.Education;
import hygge.facade.ics.FacadeLocal;

/**
 * Servlet implementation class EducationServlet
 */
@WebServlet("/EducationServlet")
public class EducationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    @EJB
    FacadeLocal facade;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EducationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = null;

		// Get hidden field
		String operation = request.getParameter("operation");

		switch (operation) {

		case "showeducation":
			System.out.println("EducationServlet-showeducation");
			String name = request.getParameter("txtEducationName");
			Education e = facade.findByEducationName(name);
			request.setAttribute("education", e);
			url="/ShowEducation.jsp";
			break;

		case "searcheducation":
			System.out.println("EducationServlet-searcheducation");
			url = "/SearchEducation.jsp";
			break;

		default: // default landing page
			url = "/SearchEducation.jsp";
		}

		System.out.println(url);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
