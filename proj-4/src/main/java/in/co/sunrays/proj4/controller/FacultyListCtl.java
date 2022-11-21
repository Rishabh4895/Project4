/**
 * 
 */
package in.co.sunrays.proj4.controller;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import in.co.sunrays.proj4.bean.BaseBean;
import in.co.sunrays.proj4.bean.FacultyBean;
import in.co.sunrays.proj4.exception.ApplicationException;
import in.co.sunrays.proj4.model.CollegeModel;
import in.co.sunrays.proj4.model.CourseModel;
import in.co.sunrays.proj4.model.FacultyModel;
import in.co.sunrays.proj4.model.SubjectModel;
import in.co.sunrays.proj4.util.DataUtility;
import in.co.sunrays.proj4.util.PropertyReader;
import in.co.sunrays.proj4.util.ServletUtility;

/**
 * 
 * Faculty List functionality Controller. Performs operation for list, search
 * and delete operations of Faculty
 * 
 * @author SunilOS
 * @version 1.0
 * @Copyright (c) SunilOS
 *
 */
@WebServlet(name = "FacultyListCtl", urlPatterns = { "/ctl/FacultyListCtl" })
public class FacultyListCtl extends BaseCtl {
	private static Logger log = Logger.getLogger(FacultyListCtl.class);

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
	protected BaseBean populateBean(HttpServletRequest request) {
		log.debug("FacultyCtl populatebean started");
		FacultyBean bean = new FacultyBean();
		bean.setCourseId(DataUtility.getLong(request.getParameter("courseId")));
		
		bean.setCollegeId(DataUtility.getLong(request.getParameter("collegeId")));
		System.out.println("cLG id is" + bean.getCollegeId());
		bean.setFirstName(DataUtility.getString(request.getParameter("firstName")));
		bean.setLastName(DataUtility.getString(request.getParameter("lastName")));
		bean.setEmailId(DataUtility.getString(request.getParameter("login")));
		log.debug("FacultyCtl populatebean ended");
		return bean;

	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		log.debug("FacultyListCtl doGet Started");
		System.out.println("FacultyListCtl do get Started");
		int pageNo = 1;
		int pageSize = DataUtility.getInt(PropertyReader.getValue("page.size"));
		System.out.println("pageSize is" + pageSize);

		FacultyBean bean = (FacultyBean) populateBean(request);
		FacultyModel model = new FacultyModel();
		try {
			List list = model.search(bean, pageNo, pageSize);
			if (list.size() == 0 || list == null) {
				ServletUtility.setErrorMessage("No Record Found", request);
			}

			ServletUtility.setList(list, request);
			ServletUtility.setPageNo(pageNo, request);
			ServletUtility.setPageSize(pageSize, request);
			ServletUtility.forward(getView(), request, response);
		} catch (ApplicationException e) {

			ServletUtility.handleException(e, request, response);
			return;
		}
		System.out.println("FacultyListCtl do get Started");
		log.debug("FacultyListCtl doGet Ended");

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		log.debug("SubjectListCtl doPost Start");
		List list = null;
		int pageNo = DataUtility.getInt(request.getParameter("pageNo"));

		int pageSize = DataUtility.getInt(request.getParameter("pageSize"));

		pageNo = (pageNo == 0) ? 1 : pageNo;
		pageSize = (pageSize == 0) ? DataUtility.getInt(PropertyReader.getValue("page.size")) : pageSize;
		FacultyBean bean = (FacultyBean) populateBean(request);
		String op = DataUtility.getStringData(request.getParameter("operation"));
		String[] ids = request.getParameterValues("ids");
		FacultyModel model = new FacultyModel();
		System.out.println("in do post faculty list" + op);

		try {

			if (OP_SEARCH.equalsIgnoreCase(op) || OP_NEXT.equalsIgnoreCase(op) || OP_PREVIOUS.equalsIgnoreCase(op)) {

				if (OP_SEARCH.equalsIgnoreCase(op)) {
					pageNo = 1;
				} else if (OP_NEXT.equalsIgnoreCase(op)) {
					pageNo++;
				} else if (OP_PREVIOUS.equalsIgnoreCase(op) && pageNo > 1) {
					pageNo--;
				}

			} else if (OP_NEW.equalsIgnoreCase(op)) {
				ServletUtility.redirect(ORSView.FACULTY_CTL, request, response);
				return;
			} else if (OP_DELETE.equalsIgnoreCase(op)) {
				pageNo = 1;
				if (ids != null && ids.length > 0) {
					FacultyBean deletebean = new FacultyBean();
					for (String id : ids) {
						System.out.println("in for id is"+id);
						deletebean.setId(DataUtility.getInt(id));
						model.delete(deletebean);
					}
					ServletUtility.setSuccessMessage("Record Deleted Successfully", request);
				} else {
					ServletUtility.setErrorMessage("Select at least one record", request);
				}
			} else if (OP_BACK.equalsIgnoreCase(op)) {
				ServletUtility.redirect(ORSView.FACULTY_LIST_CTL, request, response);
				return;
			} else if (OP_RESET.equalsIgnoreCase(op)) {
				ServletUtility.redirect(ORSView.FACULTY_LIST_CTL, request, response);
				return;
			}
			list = model.search(bean, pageNo, pageSize);
			System.out.println("list size" + list.size());
			Iterator<FacultyBean> it = list.iterator();
			while (it.hasNext()) {
				FacultyBean bean1 = it.next();
				System.out.println(bean1.getFirstName());
			}

			// request.setAttribute("usebean",bean);

			if (list == null || list.size() == 0) {
				ServletUtility.setErrorMessage("No record found ", request);

			}
			// ServletUtility.setList(list, request);;
			ServletUtility.setList(list, request);

			System.out.println("bean set");
			ServletUtility.setBean(bean, request);
			ServletUtility.setPageNo(pageNo, request);
			ServletUtility.setPageSize(pageSize, request);
			ServletUtility.forward(getView(), request, response);

		} catch (ApplicationException e) {
			log.error(e);
			ServletUtility.handleException(e, request, response);
			return;
		}
		log.debug("FacultyListCtl doPost End");
	}

	@Override
	protected String getView() {

		return ORSView.FACULTY_LIST_VIEW;
	}

}
