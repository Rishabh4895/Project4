/**
 * 
 */
package in.co.sunrays.proj4.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import in.co.sunrays.proj4.bean.BaseBean;
import in.co.sunrays.proj4.bean.SubjectBean;
import in.co.sunrays.proj4.exception.ApplicationException;
import in.co.sunrays.proj4.exception.DatabaseException;
import in.co.sunrays.proj4.exception.DuplicateRecordException;
import in.co.sunrays.proj4.model.CourseModel;
import in.co.sunrays.proj4.model.SubjectModel;
import in.co.sunrays.proj4.util.DataUtility;
import in.co.sunrays.proj4.util.DataValidator;
import in.co.sunrays.proj4.util.PropertyReader;
import in.co.sunrays.proj4.util.ServletUtility;

/**
 * Subject functionality Controller. Performs operation for add, update and get
 * Subject
 * 
 * @author SunilOS
 * @version 1.0
 * @Copyright (c) SunilOS
 */
@WebServlet(name="SubjectCtl",urlPatterns={"/ctl/SubjectCtl"})
public class SubjectCtl extends BaseCtl{

	private static Logger log=Logger.getLogger(SubjectCtl.class);
	private static final long serialVersionUID = 1L;
  
    @Override
    protected void preload(HttpServletRequest request) {
    	CourseModel model=new CourseModel();
    	try {
			List list=model.list();
			request.setAttribute("courseList",list);
		} catch (ApplicationException e) {
			
			e.printStackTrace();
		}
    	
    	
    }
	
    @Override
    protected boolean validate(HttpServletRequest request) {
    	 
    	 log.debug("courseCtl Method validate Ended");
	        boolean pass = true;
	        if (DataValidator.isNull(request.getParameter("name"))) {
	            request.setAttribute("name",
	                    PropertyReader.getValue("error.require", "Name "));
	            pass = false;
	        }

	        if (DataValidator.isNull(request.getParameter("description"))) {
	            request.setAttribute("description",
	                    PropertyReader.getValue("error.require", "Description "));
	            pass = false;
	        }
	        if(DataValidator.isNull(request.getParameter("courseId"))){
	        	;
	        request.setAttribute("courseName", PropertyReader.getValue("error.require","Course Name "));	
	        pass=false;
	        }

	        log.debug("courseCtl Method validate Ended");
	       
	        
    	return pass;
    }
    
    @Override
    protected BaseBean populateBean(HttpServletRequest request) {
    	SubjectBean bean=new SubjectBean();
    	bean.setId(DataUtility.getLong(request.getParameter("id")));
    	bean.setName(DataUtility.getString(request.getParameter("name")));
    	bean.setCourseId(DataUtility.getLong(request.getParameter("courseId")));
    	System.out.println("pop"+ bean.getCourseId());
    	bean.setDescription(DataUtility.getString(request.getParameter("description")));
    	populateDTO(bean, request);
    	return bean;
    }
    /**
     * contains display logics
     * 
     */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 log.debug("courseCtl Method doGet Started");
	    
        System.out.println("SubjectCtl Method doGet Started");

        String op = DataUtility.getString(request.getParameter("operation"));

        // get model
        SubjectModel model = new SubjectModel();

        long id = DataUtility.getLong(request.getParameter("id"));
        if (id > 0 || op != null) {
            SubjectBean bean;
            try {
                bean = model.findByPK(id);
                ServletUtility.setBean(bean, request);
            } catch (ApplicationException e) {
                log.error(e);
                ServletUtility.handleException(e, request, response);
                return;
            }
        }
        System.out.println("in do get forwarded to view");
        ServletUtility.forward(getView(), request, response);
         log.debug("courseCtl Method doGetEnded");
       System.out.println("subjectCtl Method doGetEnded"); 
		
	}
	/**
	 * contains submit logics
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 log.debug("CourseCtl Method doPost Started");

        System.out.println("CourseCtl Method doPost Started");
        String op = DataUtility.getString(request.getParameter("operation"));
        SubjectModel model=new SubjectModel();
        
        long id=DataUtility.getLong(request.getParameter("id"));
        if (OP_SAVE.equalsIgnoreCase(op)||OP_UPDATE.equalsIgnoreCase(op)) {

            SubjectBean bean = (SubjectBean) populateBean(request);

            try {
                if (id > 0) {
                    model.update(bean);
                    ServletUtility.setBean(bean, request);
                    ServletUtility.setSuccessMessage("Data is successfully updated",
                            request);
                    
                } else {
                    long pk = model.add(bean);
                    //bean.setId(pk);
                    ServletUtility.setSuccessMessage("Data is successfully saved",
                            request);
                    
                }

                //ServletUtility.setBean(bean, request);
                

            } catch (ApplicationException e) {
                log.error(e);
                ServletUtility.handleException(e, request, response);
                return;
            } catch (DuplicateRecordException e) {
                ServletUtility.setBean(bean, request);
                ServletUtility.setErrorMessage("Subject already exists", request);
            } catch (DatabaseException e) {
				
				//e.printStackTrace();
			}

        } else if (OP_DELETE.equalsIgnoreCase(op)) {

            SubjectBean bean = (SubjectBean) populateBean(request);
            try {
                model.delete(bean);
                ServletUtility.redirect(ORSView.SUBJECT_LIST_CTL, request,
                        response);
                return;
            } catch (ApplicationException e) {
                log.error(e);
                ServletUtility.handleException(e, request, response);
                return;
            }

        } else if (OP_CANCEL.equalsIgnoreCase(op)) {

            ServletUtility.redirect(ORSView.SUBJECT_LIST_CTL, request, response);
            return;

        }else if (OP_BACK.equalsIgnoreCase(op)) {
        	ServletUtility.redirect(ORSView.SUBJECT_LIST_CTL, request, response);
            return;
		}

        ServletUtility.forward(getView(), request, response);

        log.debug("SubjectCtl Method doPost Ended");
        System.out.println("SubjectCtl Method doPOst Ended");

		
		
	}

	
	@Override
	protected String getView() {
		
		return ORSView.SUBJECT_VIEW;
	}

}
