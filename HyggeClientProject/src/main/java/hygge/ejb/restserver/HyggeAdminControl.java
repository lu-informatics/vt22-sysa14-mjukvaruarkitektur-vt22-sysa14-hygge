package hygge.ejb.restserver;

import java.io.IOException;
import java.io.PrintWriter;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hygge.ejb.ics.Industry;
import hygge.facade.ics.FacadeLocal;

/**
 * Servlet implementation class HyggeAdminControl
 */
@WebServlet("/HyggeAdminControl/*")
public class HyggeAdminControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@EJB
	FacadeLocal facade;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HyggeAdminControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String pathInfo=request.getPathInfo();
		if(pathInfo==null || pathInfo.equals("/")) {
			System.out.println("All");
			System.out.println(pathInfo);
			return;
		}
		String[] splits = pathInfo.split("/");
		if(splits.length!=2) {
			System.out.println("All2");
			response.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return;
		}
		
		String name = splits[1];
		Industry industry = facade.findByIndustryName(name);
		sendAsJson(response,industry);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
	
	private void sendAsJson(HttpServletResponse response, Industry industry)throws IOException{
		PrintWriter out = response.getWriter();
		response.setContentType("application/json");
		if (industry!=null) {
			out.print("{\"name\":");
			out.print("\"" + industry.getIndustryName() + "\"");
			out.print(",\"field\":");
			out.print("\"" +industry.getField()+"\"}");
		}else out.print("{}");
		out.flush();
	}
}
