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
import in.co.sunrays.proj4.bean.TimetableBean;
import in.co.sunrays.proj4.exception.ApplicationException;
import in.co.sunrays.proj4.exception.DatabaseException;
import in.co.sunrays.proj4.exception.DuplicateRecordException;
import in.co.sunrays.proj4.model.CourseModel;
import in.co.sunrays.proj4.model.SubjectModel;
import in.co.sunrays.proj4.model.TimetableModel;
import in.co.sunrays.proj4.util.DataUtility;
import in.co.sunrays.proj4.util.DataValidator;
import in.co.sunrays.proj4.util.PropertyReader;
import in.co.sunrays.proj4.util.ServletUtility;

/**
 * Timetable functionality Controller. Performs operation for add, update and
 * get Timetable
 * 
 * @author SunilOS
 * @version 1.0
 * @Copyright (c) SunilOS
 */
@WebServlet(name="TimetableCtl",urlPatterns={"/ctl/TimetableCtl"})
public class TimetableCtl extends BaseCtl {

	private static Logger log = Logger.getLogger(TimetableCtl.class);

	@Override
	protected void preload(HttpServletRequest request) {
		log.debug("Timetable Ctl preload start");

		try {
			CourseModel cModel = new CourseModel();
			List courseList = cModel.list();
			request.setAttribute("courseList", courseList);

			SubjectModel sModel = new SubjectModel();
			List subjectList = sModel.list();
			request.setAttribute("subjectList", subjectList);

		} catch (ApplicationException e) {
			log.error(e);
			e.printStackTrace();
		}

		log.debug("Timetable Ctl preload ended");
	}

	@Override
	protected boolean validate(HttpServletRequest request) {
		log.debug("TimetableCtl Method validate Started");
		String date = request.getParameter("examDate");
		boolean pass = true;
		if (DataValidator.isNull(request.getParameter("subjectId"))) {
			request.setAttribute("subjectName", PropertyReader.getValue("error.require", " Subject "));
			pass = false;
		}

		if (DataValidator.isNull(request.getParameter("courseId"))) {
			request.setAttribute("courseName", PropertyReader.getValue("error.require", " Course "));
			pass = false;
		}
		if (DataValidator.isNull(request.getParameter("examTime"))) {
			request.setAttribute("examTime", PropertyReader.getValue("error.require", "ExamTime "));
			pass = false;
		}
		if (DataValidator.isNull(date)) {
			request.setAttribute("examDate", PropertyReader.getValue("error.require", " ExamDate "));
			pass = false;
		} else if (!DataValidator.isDate(date)) {
			request.setAttribute("examDate", PropertyReader.getValue("error.date", " ExamDate "));
			pass = false;
		}
		if (DataValidator.isNull(request.getParameter("semester"))) {
			request.setAttribute("semester", PropertyReader.getValue("error.require", "Semester "));
		}
		log.debug("TimetableCtl Method validate Ended");
		return pass;

	}

	@Override
	protected BaseBean populateBean(HttpServletRequest request) {
		log.debug("TimetableCtl Method populatebean Started");
		TimetableBean bean = new TimetableBean();
		bean.setCourseId(DataUtility.getLong(request.getParameter("courseId")));
		//System.out.println("date in request"+request.getParameter("examDate"));
		bean.setExamDate(DataUtility.getDate(request.getParameter("examDate")));
		//System.out.println("exam date in timetable"+bean.getExamDate());
		bean.setSubjectId(DataUtility.getLong(request.getParameter("subjectId")));
		bean.setSemester(DataUtility.getInt(request.getParameter("semester")));
		bean.setExamTime(DataUtility.getString(request.getParameter("examTime")));
		populateDTO(bean, request);
		log.debug("TimetableCtl Method populatebean Ended");
		return bean;
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		log.debug("TimetableCtl Method validate Started");
		String op = DataUtility.getString(request.getParameter("operation"));
		Long id = DataUtility.getLong(request.getParameter("id"));
		if (id > 0 || op != null) {
			TimetableModel model = new TimetableModel();
			try {
				TimetableBean bean = model.findByPK(id);
				ServletUtility.setBean(bean, request);
			} catch (ApplicationException e) {
				log.error(e);
				ServletUtility.handleException(e, request, response);

			}
		}
		ServletUtility.forward(getView(), request, response);
		log.debug("TimetableCtl Method doGet Ended");

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		log.debug("TimetableCtl Method doPost Started");
		String op = DataUtility.getString(request.getParameter("operation"));
		//System.out.println("in posT op is"+op);

		TimetableBean bean = (TimetableBean) populateBean(request);
		long id = DataUtility.getLong(request.getParameter("id"));
		TimetableModel model = new TimetableModel();
		if (OP_SAVE.equals(op) || OP_UPDATE.equals(op)) {

			try {
				if (id > 0) {
					//System.out.println("in update if");
					ServletUtility.setBean(bean, request);
					bean.setId(DataUtility.getLong(request.getParameter("id")));
					model.update(bean);
					
					ServletUtility.setSuccessMessage("Data is succesfully updated", request);
					
				} else {
					//System.out.println("in else add");
					model.add(bean);
					ServletUtility.setSuccessMessage("Data is succesfully saved", request);
				}
				
			} catch (ApplicationException e) {
				ServletUtility.handleException(e, request, response);
				return ;

			} catch (DuplicateRecordException e) {
				ServletUtility.setBean(bean, request);
				ServletUtility.setErrorMessage("Timetable already scheduled", request);
				
			} catch (DatabaseException e) {
				ServletUtility.handleException(e, request, response);
				
			}

		} else if (OP_DELETE.equals(op)) {
			try {
				model.delete(bean);
			} catch (ApplicationException e) {
				log.error(e);
				ServletUtility.handleException(e, request, response);
			}
		}else if (OP_BACK.equalsIgnoreCase(op)) {
        	ServletUtility.redirect(ORSView.TIMETABLE_LIST_CTL, request, response);
            return;
		}else if (OP_RESET.equalsIgnoreCase(op)) {
       	ServletUtility.redirect(ORSView.TIMETABLE_CTL, request, response);
           return;
		}else if (OP_CANCEL.equalsIgnoreCase(op)) {
        	ServletUtility.redirect(ORSView.TIMETABLE_LIST_CTL, request, response);
            return;
		}
		ServletUtility.forward(getView(), request, response);
		log.debug("TimetableCtl Method doPost Ended");

	}

	@Override
	protected String getView() {

		return ORSView.TIMETABLE_VIEW;
	}

}
