package in.co.sunrays.proj4.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import in.co.sunrays.proj4.bean.BaseBean;
import in.co.sunrays.proj4.bean.StudentBean;
import in.co.sunrays.proj4.exception.ApplicationException;
import in.co.sunrays.proj4.exception.DuplicateRecordException;
import in.co.sunrays.proj4.model.CollegeModel;
import in.co.sunrays.proj4.model.StudentModel;
import in.co.sunrays.proj4.util.DataUtility;
import in.co.sunrays.proj4.util.DataValidator;
import in.co.sunrays.proj4.util.PropertyReader;
import in.co.sunrays.proj4.util.ServletUtility;

/**
 * Student functionality Controller. Performs operation for add, update, delete
 * and get Student
 * 
 * @author SunilOS
 * @version 1.0
 * @Copyright (c) SunilOS
 */
@ WebServlet(name="StudentCtl",urlPatterns={"/ctl/StudentCtl"})
public class StudentCtl extends BaseCtl {

    private static Logger log = Logger.getLogger(StudentCtl.class);

    @Override
    protected void preload(HttpServletRequest request) {
        CollegeModel model = new CollegeModel();
        try {
            List l = model.list();
            request.setAttribute("collegeList", l);
        } catch (ApplicationException e) {
            log.error(e);
        }

    }

    @Override
    protected boolean validate(HttpServletRequest request) {

        log.debug("StudentCtl Method validate Started");

        boolean pass = true;

        String op = DataUtility.getString(request.getParameter("operation"));
        String email = request.getParameter("email");
        String dob = request.getParameter("dob");

        if (DataValidator.isNull(request.getParameter("firstName"))) {
            request.setAttribute("firstName",
                    PropertyReader.getValue("error.require", "First Name "));
            pass = false;
        }else if (!DataValidator.isName(request.getParameter("firstName"))) {
			request.setAttribute("firstName",PropertyReader.getValue("error.name","First Name "));
			pass=false;
		}
        if (DataValidator.isNull(request.getParameter("lastName"))) {
            request.setAttribute("lastName",
                    PropertyReader.getValue("error.require", "Last Name "));
            pass = false;
        }else if (!DataValidator.isName(request.getParameter("lastName"))) {
			request.setAttribute("lastName",PropertyReader.getValue("error.name","Last Name "));
			pass=false;
		}
        if (DataValidator.isNull(request.getParameter("mobileNo"))) {
            request.setAttribute("mobileNo",
                    PropertyReader.getValue("error.require", "Mobile No "));
            pass = false;
        }else if (!DataValidator.isMobileNumber(request.getParameter("mobileNo"))) {
        	request.setAttribute("mobileNo",
                    PropertyReader.getValue("error.number", "Mobile No "));
            pass = false;
		}
        if (DataValidator.isNull(email)) {
            request.setAttribute("email",
                    PropertyReader.getValue("error.require", "Email "));
            pass = false;
        } else if (!DataValidator.isEmail(email)) {
            request.setAttribute("email",
                    PropertyReader.getValue("error.email", "Email "));
            pass = false;
        }
        if (DataValidator.isNull(request.getParameter("collegeId"))) {
            request.setAttribute("collegeId",
                    PropertyReader.getValue("error.require", "College "));
            pass = false;
        }
        if (DataValidator.isNull(dob)) {
            request.setAttribute("dob",
                    PropertyReader.getValue("error.require", " Date Of Birth "));
            pass = false;
        } else if (!DataValidator.isDate(dob)) {
            request.setAttribute("dob",
                    PropertyReader.getValue("error.date", " Date Of Birth "));
            pass = false;
        }

        log.debug("StudentCtl Method validate Ended");

        return pass;
    }

    @Override
    protected BaseBean populateBean(HttpServletRequest request) {

        log.debug("StudentCtl Method populatebean Started");

        StudentBean bean = new StudentBean();

        bean.setId(DataUtility.getLong(request.getParameter("id")));

        bean.setFirstName(DataUtility.getString(request
                .getParameter("firstName")));

        bean.setLastName(DataUtility.getString(request.getParameter("lastName")));

        bean.setDob(DataUtility.getDate(request.getParameter("dob")));

        bean.setMobileNo(DataUtility.getString(request.getParameter("mobileNo")));

        bean.setEmail(DataUtility.getString(request.getParameter("email")));

        bean.setCollegeId(DataUtility.getLong(request.getParameter("collegeId")));

        populateDTO(bean, request);
        

        log.debug("StudentCtl Method populatebean Ended");

        return bean;
    }

    /**
     * Contains Display logics
     */
    @Override
	protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {

        log.debug("StudentCtl Method doGet Started");

        String op = DataUtility.getString(request.getParameter("operation"));
        long id = DataUtility.getLong(request.getParameter("id"));

        // get model

        StudentModel model = new StudentModel();
        if (id > 0 || op != null) {
            StudentBean bean;
            try {
                bean = model.findByPK(id);
                ServletUtility.setBean(bean, request);
            } catch (ApplicationException e) {
                log.error(e);
                ServletUtility.handleException(e, request, response);
                return;
            }
        }
        ServletUtility.forward(getView(), request, response);
        log.debug("StudentCtl Method doGett Ended");
    }

    /**
     * Contains Submit logics
     */
    @Override
	protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {

        log.debug("StudentCtl Method doPost Started");

        String op = DataUtility.getString(request.getParameter("operation"));

        // get model

        StudentModel model = new StudentModel();

        long id = DataUtility.getLong(request.getParameter("id"));
System.out.println("ID in post is"+id);
        if (OP_SAVE.equalsIgnoreCase(op)||OP_UPDATE.equalsIgnoreCase(op)) {

            StudentBean bean = (StudentBean) populateBean(request);

            try {
                if (id > 0) {
                    model.update(bean);
                    ServletUtility.setBean(bean, request);
                    ServletUtility.setSuccessMessage("Data is successfully updated",
                            request);

                } else {
                    long pk = model.add(bean);
                   // bean.setId(pk);
                    ServletUtility.setSuccessMessage("Data is successfully saved",
                            request);
                }

               // ServletUtility.setBean(bean, request);
                

            } catch (ApplicationException e) {
                log.error(e);
                ServletUtility.handleException(e, request, response);
                return;
            } catch (DuplicateRecordException e) {
                ServletUtility.setBean(bean, request);
                ServletUtility.setErrorMessage(
                        "Student Email Id already exists", request);
            }

        }

        else if (OP_DELETE.equalsIgnoreCase(op)) {

            StudentBean bean = (StudentBean) populateBean(request);
            try {
                model.delete(bean);
                ServletUtility.redirect(ORSView.STUDENT_LIST_CTL, request,
                        response);
                return;

            } catch (ApplicationException e) {
               log.error(e);
                ServletUtility.handleException(e, request, response);
                return;
            }

        } else if (OP_CANCEL.equalsIgnoreCase(op)) {

            ServletUtility
                    .redirect(ORSView.STUDENT_LIST_CTL, request, response);
            return;

        }else if (OP_RESET.equalsIgnoreCase(op)) {
			
		ServletUtility.redirect(ORSView.STUDENT_CTL, request, response);
		return;
		}
        ServletUtility.forward(getView(), request, response);

        log.debug("StudentCtl Method doPost Ended");
    }

    @Override
    protected String getView() {
        return ORSView.STUDENT_VIEW;
    }

}
