package hygge.ejb.client;

import java.io.IOException;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hygge.ejb.ics.Education;
import hygge.ejb.ics.Industry;
import hygge.facade.ics.FacadeLocal;

/**
 * Servlet implementation class MergedServlet
 */
@WebServlet("/MergedServlet")
public class MergedServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB
	FacadeLocal facade;
	Industry currentIndustry;
	Education currentEducation;
	String entityType, url;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MergedServlet() {
		super();
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		entityType = request.getParameter("entityType");

		if (request.getParameter("navigate") != null) {
			switch (request.getParameter("navigate")) {

			case "search":
				System.out.println("MergedServlet-search");
				url = String.format("/Search%s.jsp", entityType);
				break;

			case "create":
				System.out.println("MergedServlet-create");
				doPost(request, response);
				return;

			case "fetch":
				System.out.println("MergedServlet-fetch");
				doGet(request, response);
				return;
			case "update":
				System.out.println("MergedServlet-update");
				doPut(request, response);
				return;

			case "delete":
				System.out.println("MergedServlet-delete");
				doDelete(request, response);
				return;

			case "home":
				System.out.println("MainServlet-home");
				url = "/Home.jsp";
				break;

			case "about":
				System.out.println("MainServlet-about");
				url = "/About.jsp";
				break;
				
			case "manageRelationships":
				System.out.println("MergedServlet-manageRelationships");
				manageEntityRelationship(request,response);
				return;

			default:
				url = "/Home.jsp";
			}
			dispatch(url, request, response);
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("MergedServlet-show");
		String id = request.getParameter("txtID");
		entityType = request.getParameter("entityType");
		boolean requestedSingleEntity = (id != null && id.strip() != "");
		if (requestedSingleEntity) {
			if (entityType.equals("Industry")) {
				Industry i = facade.findByIndustryName(id);
				currentIndustry = i;
				request.setAttribute("entity", i);
				request.setAttribute("connectedEntities",facade.fetchConnectedEducations(i));
			} else {
				Education e = facade.findByEducationName(id);
				currentEducation = e;
				request.setAttribute("entity", e);
				request.setAttribute("connectedEntities",facade.fetchConnectedIndustries(e));
			}
		}

		if (entityType.equals("Industry")) {
			List<Industry> allIndustries = facade.getAllIndustries();
			request.setAttribute("Industries", allIndustries);
		} else {
			List<Education> allEducations = facade.getAllEducations();
			request.setAttribute("Educations", allEducations);
		}

		url = String.format(requestedSingleEntity ? "/Show%s.jsp" : "/%sTable.jsp", entityType);
		dispatch(url, request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("MergedServlet-create");
		entityType = request.getParameter("entityType");
		String name = request.getParameter("txtID");
		if (entityType.equals("Industry")) {
			Industry i = new Industry();
			i.setIndustryName(name);
			i.setField(request.getParameter("txtField"));
			facade.createIndustry(i);
			currentIndustry = i;
			request.setAttribute("entity", i);
		} else {
			Education e = new Education();
			e.setEducationName(name);
			e.setLocale(request.getParameter("txtLocale"));
			facade.createEducation(e);
			currentEducation = e;
			request.setAttribute("entity", e);
		}
		request.setAttribute("origin", "table");
		// url = String.format("/Show%s.jsp", entityType);
		// dispatch(url, request, response);
		doGet(request, response);
	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("MergedServlet-update");
		String id = request.getParameter("txtID");
		entityType = request.getParameter("entityType");

		if (entityType.equals("Industry")) {
			currentIndustry.setIndustryName(id);
			currentIndustry.setField(request.getParameter("txtField"));
			facade.updateIndustry(currentIndustry);
			request.setAttribute("entity", currentIndustry);
		} else {
			currentEducation.setEducationName(id);
			currentEducation.setLocale(request.getParameter("txtLocale"));
			facade.updateEducation(currentEducation);
			request.setAttribute("entity", currentEducation);
		}
		request.setAttribute("origin", request.getParameter("origin"));
		String.format("/Show%s.jsp", entityType);
		dispatch(url, request, response);
	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		entityType = request.getParameter("entityType");
		System.out.println("MergedServlet-delete");
		if (entityType.equals("Industry")) {
			if (currentIndustry != null)
				facade.deleteIndustry(currentIndustry.getIndustryName());

		} else if (currentEducation != null)
			facade.deleteEducation(currentEducation.getEducationName());

		doGet(request, response);
	}

	protected void manageEntityRelationship(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Industry industry = facade.findByIndustryName(request.getParameter("txtIndustryName"));
		Education education = facade.findByEducationName(request.getParameter("txtEducationName"));
		String operation = request.getParameter("operation");
		if (operation.equals("attach"))
			facade.connectEducationToIndustry(industry, education);
		else if (operation.equals("detach"))
			facade.detachEducationFromIndustry(industry, education);
		request.setAttribute("industry", industry);
		request.setAttribute("education", education);
		doGet(request,response);
	}

	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println(url);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
