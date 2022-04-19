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
	Education currentEducation;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EducationServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Education e;
		String name;
		String locale;
		String url = null;
		// Get hidden field
		String operation = request.getParameter("operation");

		switch (operation) {

		case "createeducation":
			System.out.println("EducationServlet-createeducation");
			name = request.getParameter("txtEducationName");
			locale = request.getParameter("txtLocale");
			e = new Education();
			e.setEducationName(name);
			e.setLocale(locale);
			facade.createEducation(e);
			request.setAttribute("education", e);
			url="/ShowEducation.jsp";
			break;
		
		case "showeducation":
			System.out.println("EducationServlet-showeducation");
			name = request.getParameter("txtEducationName");
			e = facade.findByEducationName(name);
			currentEducation = e;
			request.setAttribute("education", e);
			url = "/ShowEducation.jsp";
			break;

		case "searcheducation":
			System.out.println("EducationServlet-searcheducation");
			url = "/SearchEducation.jsp";
			break;

		case "updateeducation":
			System.out.println("EducationServlet-updateeducation");
			name = request.getParameter("txtEducationName");
			locale = request.getParameter("txtLocale");
			currentEducation.setEducationName(name);
			currentEducation.setLocale(locale);
			facade.updateEducation(currentEducation);

			request.setAttribute("education", currentEducation);
			url = "/ShowEducation.jsp";
			break;
		
		case "deleteeducaion":
			System.out.println("EducationServlet-deleteeducation");
			if (currentEducation!=null){
				facade.deleteEducation(currentEducation.getEducationName());
				url = "/SearchEducation.jsp";
			}
			else url = "/ShowEducation.jsp";
			break;

		default: // default landing page
			url = "/SearchEducation.jsp";
		}

		System.out.println(url);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
