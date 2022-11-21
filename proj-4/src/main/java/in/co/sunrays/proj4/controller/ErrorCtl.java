package in.co.sunrays.proj4.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.co.sunrays.proj4.util.ServletUtility;

/**
 * Servlet implementation class ErrorCtl
 */
@WebServlet(name="ErrorCtl",urlPatterns={"/ErrorCtl"})
public class ErrorCtl extends BaseCtl {
	private static final long serialVersionUID = 1L;
       
  
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletUtility.forward(getView(), request, response);
	}

	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String op=request.getParameter("operation");
		//System.out.println("in pos"+op);
		if(OP_BACK.equalsIgnoreCase(op)){
			ServletUtility.redirect(ORSView.WELCOME_CTL, request, response);
				}
		
		
	}


	
	@Override
	protected String getView() {
		
		return ORSView.ERROR_VIEW;
	}

}
