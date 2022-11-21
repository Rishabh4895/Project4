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
import in.co.sunrays.proj4.bean.FacultyBean;
import in.co.sunrays.proj4.exception.ApplicationException;
import in.co.sunrays.proj4.exception.DatabaseException;
import in.co.sunrays.proj4.exception.DuplicateRecordException;
import in.co.sunrays.proj4.model.CollegeModel;
import in.co.sunrays.proj4.model.CourseModel;
import in.co.sunrays.proj4.model.FacultyModel;
import in.co.sunrays.proj4.model.SubjectModel;
import in.co.sunrays.proj4.util.DataUtility;
import in.co.sunrays.proj4.util.DataValidator;
import in.co.sunrays.proj4.util.PropertyReader;
import in.co.sunrays.proj4.util.ServletUtility;

/**
 * Faculty functionality Controller. Performs operation for add, update and get
 * Faculty
 * 
 * @author SunilOS
 * @version 1.0
 * @Copyright (c) SunilOS
 */
@WebServlet(name = "FacultyCtl", urlPatterns = { "/ctl/FacultyCtl" })
public class FacultyCtl extends BaseCtl {

	private static Logger log = Logger.getLogger(FacultyCtl.class);

	@Override
	protected void preload(HttpServletRequest request) {
		log.debug("FacultyCtl preload started");

		CollegeModel clgmodel = new CollegeModel();
		try {
			List list = clgmodel.list();
			request.setAttribute("collegeList", list);
		} catch (ApplicationException e) {
			log.error(e);
			e.printStackTrace();
		}
		SubjectModel subjectmodel = new SubjectModel();
		try {
			List li = subjectmodel.list();
			request.setAttribute("subjectList", li);
		} catch (ApplicationException e) {
			log.error(e);
			e.printStackTrace();
		}
		CourseModel courseModel = new CourseModel();
		try {
			List lis = courseModel.list();
			request.setAttribute("courseList", lis);
		} catch (ApplicationException e) {
			log.error(e);
			e.printStackTrace();
		}
		log.debug("FacultyCtl preload ended");
	}

	@Override
	protected boolean validate(HttpServletRequest request) {
		log.debug("faculty ctl validate started");
		boolean pass = true;
		String login=request.getParameter("loginId");
		System.out.println("login is "+login);
		
		//String dob = request.getParameter("dob");
		System.out.println("faculty ctl validate started");
		if (DataValidator.isNull(request.getParameter("firstName"))) {
			request.setAttribute("firstName", PropertyReader.getValue("error.require", "First Name "));
			pass = false;
		} else if (!DataValidator.isName(request.getParameter("firstName"))) {
			request.setAttribute("firstName", PropertyReader.getValue("error.name", "First Name "));
			pass = false;
		}

		if (DataValidator.isNull(request.getParameter("lastName"))) {
			request.setAttribute("lastName", PropertyReader.getValue("error.require", "Last Name "));
			pass = false;
		} else if (!DataValidator.isName(request.getParameter("lastName"))) {
			request.setAttribute("lastName", PropertyReader.getValue("error.name", "Last Name "));
			pass = false;
		}
		
		if (DataValidator.isNull(login)) {
			System.out.println("in if"+request.getParameter("loginId"));
			request.setAttribute("loginId", PropertyReader.getValue("error.require", "Login Id "));
			pass = false;
		} else if (!DataValidator.isEmail(login)) {
			System.out.println("in else if"+request.getParameter("loginId"));
			request.setAttribute("loginId", PropertyReader.getValue("error.email", "Login Id "));
			pass = false;
		}
		

		if (DataValidator.isNull(request.getParameter("gender"))) {
			request.setAttribute("gender", PropertyReader.getValue("error.require", "Gender "));
			pass = false;
		}
		
		
		if (DataValidator.isNull(request.getParameter("mobileNo"))) {
			request.setAttribute("mobileNo", PropertyReader.getValue("error.require", "Mobile No "));
			pass = false;
		} else if (!DataValidator.isMobileNumber(request.getParameter("mobileNo"))) {
			request.setAttribute("mobileNo", PropertyReader.getValue("error.number", "Mobile No "));
			pass = false;
		}
		
		
		
		if (DataValidator.isNull(request.getParameter("dob"))) {
			request.setAttribute("dob", PropertyReader.getValue("error.require", "Date Of Birth "));
			pass = false;
		} else if (!DataValidator.isDate(request.getParameter("dob"))) {
			request.setAttribute("dob", PropertyReader.getValue("error.date", "Date Of Birth "));
		}
		if (DataValidator.isNull(request.getParameter("qualification"))) {
			request.setAttribute("qualification", PropertyReader.getValue("error.require", "Qualification "));
			pass = false;
		}
		if (DataValidator.isNull(request.getParameter("collegeId"))) {
			request.setAttribute("collegeName", PropertyReader.getValue("error.require", "College Name "));
			pass = false;
		}

		if (DataValidator.isNull(request.getParameter("courseId"))) {
			request.setAttribute("courseName", PropertyReader.getValue("error.require", "Course Name "));
			pass = false;
		}
		if (DataValidator.isNull(request.getParameter("subjectId"))) {
			request.setAttribute("subjectName", PropertyReader.getValue("error.require", "Subject Name "));
			pass = false;
		}

		log.debug("FacultyCtl method validate ended");
		System.out.println("faculty ctl validate ended");
		return pass;
	}

	@Override
	protected BaseBean populateBean(HttpServletRequest request) {
		log.debug("facultyctl method populatebean started");
		FacultyBean bean = new FacultyBean();
		bean.setId(DataUtility.getLong(request.getParameter("id")));
		bean.setFirstName(DataUtility.getString(request.getParameter("firstName")));
		bean.setLastName(DataUtility.getString(request.getParameter("lastName")));
		bean.setCollegeId(DataUtility.getLong(request.getParameter("collegeId")));
		bean.setCourseId(DataUtility.getLong(request.getParameter("courseId")));
		bean.setSubjectId(DataUtility.getLong(request.getParameter("subjectId")));
		bean.setEmailId(DataUtility.getString(request.getParameter("loginId")));
		bean.setGender(DataUtility.getString(request.getParameter("gender")));
		bean.setDOB(DataUtility.getDate(request.getParameter("dob")));
		bean.setMobileNo(DataUtility.getString(request.getParameter("mobileNo")));
		bean.setQualification(DataUtility.getString(request.getParameter("qualification")));
		populateDTO(bean, request);
		log.debug("facultyctl method populatebean started");
		return bean;
	}

	/**
	 * Contains Display Logics
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		log.debug("facultyctl method doGet started");

		String op = DataUtility.getString(request.getParameter("operation"));

		// get model
		FacultyModel model = new FacultyModel();

		long id = DataUtility.getLong(request.getParameter("id"));
		if (id > 0 || op != null) {
			FacultyBean bean;
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
		log.debug("courseCtl Method doGetEnded");

	}

	/**
	 * Contains Submit Logics
	 */

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		log.debug("FacultyCtl Method doPost Started");
		System.out.println("FacultyCtl Method doPost Started");
		String op = DataUtility.getString(request.getParameter("operation"));
		System.out.println("in Faculty post op is " + op);
		// get Model
		FacultyModel model = new FacultyModel();
		long id = DataUtility.getLong(request.getParameter("id"));
		System.out.println("in post post id is" + id);
		if (OP_SAVE.equalsIgnoreCase(op) || OP_UPDATE.equalsIgnoreCase(op)) {
			FacultyBean bean = (FacultyBean) populateBean(request);

			try {
				if (id > 0) {
					System.out.println("in faculty post if update before");
					model.update(bean);
					ServletUtility.setBean(bean, request);
					ServletUtility.setSuccessMessage("Data is successfully updated", request);
					System.out.println("in faculty post if update after");
				} else {
					long pk = model.add(bean);
					
					ServletUtility.setSuccessMessage("Data is successfully saved", request);
					System.out.println("in faculty post else add");
					// bean.setId(pk);
				}
				// ServletUtility.setBean(bean, request);
				//ServletUtility.setSuccessMessage("Data is successfully saved", request);
			} catch (ApplicationException e) {
				log.error(e);
				ServletUtility.handleException(e, request, response);
				return;
			} catch (DuplicateRecordException e) {
				ServletUtility.setBean(bean, request);
				ServletUtility.setErrorMessage("Faculty Already Exists", request);
			} catch (DatabaseException e) {
				ServletUtility.setBean(bean, request);
				ServletUtility.setErrorMessage("Data Not Saved", request);
				// e.printStackTrace();
			}
		} else if (OP_DELETE.equalsIgnoreCase(op)) {
			FacultyBean bean = (FacultyBean) populateBean(request);
			try {
				model.delete(bean);
				ServletUtility.redirect(ORSView.FACULTY_LIST_CTL, request, response);
				return;
			} catch (ApplicationException e) {
				log.error(e);
				ServletUtility.handleException(e, request, response);
				return;
			}
		} else if (OP_CANCEL.equalsIgnoreCase(op)) {
			ServletUtility.redirect(ORSView.FACULTY_LIST_CTL, request, response);
			return;
		} else if (OP_RESET.equalsIgnoreCase(op)) {
			ServletUtility.redirect(ORSView.FACULTY_CTL, request, response);
			return;
		}
		ServletUtility.forward(getView(), request, response);

		log.debug("FacultyCtl Method doPost Started");
		System.out.println("FacultyCtl Method doPost Ended");
	}

	@Override
	protected String getView() {

		return ORSView.FACULTY_VIEW;
	}

}
