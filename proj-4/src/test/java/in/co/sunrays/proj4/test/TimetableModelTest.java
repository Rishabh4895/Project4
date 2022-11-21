///**
// * 
// */
//package in.co.sunrays.proj4.test;
//
//import java.text.ParseException;
//import java.text.SimpleDateFormat;
//import java.util.ArrayList;
//import java.util.Date;
//import java.util.Iterator;
//import java.util.List;
//
//import in.co.sunrays.proj4.bean.TimetableBean;
//import in.co.sunrays.proj4.exception.ApplicationException;
//import in.co.sunrays.proj4.exception.DatabaseException;
//import in.co.sunrays.proj4.exception.DuplicateRecordException;
//import in.co.sunrays.proj4.model.TimetableModel;
//import in.co.sunrays.proj4.util.DataUtility;
//
///**
// * TimetableModel Test Class
// * 
// * @author SunilOS
// * @version 1.0
// * @Copyright (c) SunilOS
// *
// */
//public class TimetableModelTest {
//
//	/**
//	 * Model object
//	 */
//	private static TimetableModel model = new TimetableModel();
//
//	public static void main(String[] args) throws ApplicationException, ParseException {
//		// testFindByPk();
//		// testAdd();
//		// TestFindBySubjectCourse();
//		 testfindByCourseExamDate();
//		// testfindByCourseSubjectExamTimeExamDate();
//		// testUpdate();
//		// testSearch();
//		//testList();
//	}
//
//	/**tests search
//	 * @throws ParseException
//	 * 
//	 */
//	public static void testSearch() throws ParseException {
//		try {
//			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
//			Date date = sdf.parse("05/01/2019");
//			TimetableBean bean = new TimetableBean();
//			List list = new ArrayList();
//			bean.setExamDate(date);
//			//bean.setSemester(1);
//			list = model.search(bean, 0, 0);
//			if (list.size() < 0) {
//				System.out.println("Test Serach fail");
//			}
//			Iterator it = list.iterator();
//			while (it.hasNext()) {
//				bean = (TimetableBean) it.next();
//
//				System.out.println(bean.getId());
//				System.out.println(bean.getCourseId());
//				System.out.println(bean.getCourseName());
//				System.out.println(bean.getSubjectId());
//				System.out.println(bean.getSubjectName());
//				System.out.println(bean.getExamTime());
//				System.out.println(bean.getSemester());
//				System.out.println(bean.getExamDate());
//				System.out.println(bean.getCreatedBy());
//				System.out.println(bean.getCreatedDatetime());
//				System.out.println(bean.getModifiedBy());
//				System.out.println(bean.getModifiedDatetime());
//
//			}
//
//		} catch (ApplicationException e) {
//			e.printStackTrace();
//		}
//
//	}
//
//	/**
//	 * tests update
//	 * @throws ParseException 
//	 */
//	public static void testUpdate() throws ParseException {
//		try {
//			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
//			Date date = sdf.parse("06/01/2019");
//			TimetableBean bean = model.findByPK(1);
//			bean.setSubjectId(2);
//			//bean.setExamTime("3 to 6");
//			bean.setExamDate(date);
//			model.update(bean);
//			TimetableBean updatedBean = model.findByPK(1);
//			if (!"12 to 3".equals(updatedBean.getExamTime())) {
//				System.out.println("TEST UPDATE FAIL");
//			} else {
//				System.out.println("TEST UPDATE SUCCESS");
//			}
//		} catch (ApplicationException e) {
//
//			e.printStackTrace();
//		} catch (DuplicateRecordException e) {
//
//			e.printStackTrace();
//		}
//
//	}
//	
//	/**
//	 * tests add
//	 * @throws ParseException
//	 */
//	public static void testAdd() throws ParseException {
//		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
//		Date date = sdf.parse("16/01/2019");
//		TimetableBean bean = new TimetableBean();
//		bean.setCourseId(2);
//		bean.setSubjectId(4);
//		bean.setExamDate(date);
//		bean.setExamTime("6 to 9");
//		bean.setSemester(1);
//		bean.setCreatedBy("ROOT");
//		bean.setCreatedDatetime(DataUtility.getCurrentTimestamp());
//		bean.setModifiedBy("ROOT");
//		bean.setModifiedDatetime(DataUtility.getCurrentTimestamp());
//		try {
//			long pk = model.add(bean);
//			TimetableBean addedBean = model.findByPK(pk);
//
//			if (addedBean == null) {
//				System.out.println("TestAdd Fail");
//			}
//			System.out.println("Test Add Success");
//
//		} catch (ApplicationException | DuplicateRecordException | DatabaseException e) {
//
//			e.printStackTrace();
//		}
//
//	}
//
//	/**
//	 * Test Find by Pk
//	 * 
//	 * @throws ApplicationException
//	 */
//	public static void testFindByPk() {
//		try {
//			TimetableBean bean = model.findByPK(1);
//			if (bean == null) {
//				System.out.println("Test Find By PK fail");
//			} else {
//				System.out.println(bean.getId());
//				System.out.println(bean.getCourseId());
//				System.out.println(bean.getCourseName());
//				System.out.println(bean.getSubjectId());
//				System.out.println(bean.getSubjectName());
//				System.out.println(bean.getExamTime());
//				System.out.println(bean.getSemester());
//				System.out.println(bean.getExamDate());
//				System.out.println(bean.getCreatedBy());
//				System.out.println(bean.getCreatedDatetime());
//				System.out.println(bean.getModifiedBy());
//				System.out.println(bean.getModifiedDatetime());
//
//			}
//		} catch (ApplicationException e) {
//
//			e.printStackTrace();
//		}
//
//	}
//	
//	/**
//	 * tests find by subject course
//	 * @throws ApplicationException
//	 */
//	public static void TestFindBySubjectCourse() throws ApplicationException {
//		TimetableBean bean = model.findBySubjectCourse(2, 1);
//		if (bean == null) {
//			System.out.println("findBySubjectCourse Fail");
//		} else {
//			System.out.println(bean.getId());
//			System.out.println(bean.getCourseId());
//			System.out.println(bean.getCourseName());
//			System.out.println(bean.getSubjectId());
//			System.out.println(bean.getSubjectName());
//			System.out.println(bean.getExamTime());
//			System.out.println(bean.getSemester());
//			System.out.println(bean.getExamDate());
//			System.out.println(bean.getCreatedBy());
//			System.out.println(bean.getCreatedDatetime());
//			System.out.println(bean.getModifiedBy());
//			System.out.println(bean.getModifiedDatetime());
//
//		}
//
//	}
//
//	/**
//	 * tests find by course subject examtime
//	 * @throws ParseException 
//	 */
//	public static void testfindByCourseExamDate() throws ParseException {
//		
//		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
//		Date date = sdf.parse("02/16/2019");
//		
//		
//		try {
//			TimetableBean bean = model.findByCourseExamDate(5, date);
//			if (bean == null) {
//				System.out.println("Test Find by Course Subject Exam time fail");
//			} else {
//				System.out.println(bean.getId());
//				System.out.println(bean.getCourseId());
//				System.out.println(bean.getCourseName());
//				System.out.println(bean.getSubjectId());
//				System.out.println(bean.getSubjectName());
//				System.out.println(bean.getExamTime());
//				System.out.println(bean.getSemester());
//				System.out.println(bean.getExamDate());
//				System.out.println(bean.getCreatedBy());
//				System.out.println(bean.getCreatedDatetime());
//				System.out.println(bean.getModifiedBy());
//				System.out.println(bean.getModifiedDatetime());
//			}
//		} catch (ApplicationException e) {
//
//			e.printStackTrace();
//		}
//
//	}
//
//	/**
//	 * testFindByCourseExamTimeExamDate
//	 * @throws ParseException
//	 */
//	public static void testfindByCourseSubjectExamTimeExamDate() throws ParseException {
//		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
//		Date date = sdf.parse("06/01/2019");
//
//		try {
//			TimetableBean bean = model.findByCourseSubjectExamTimeExamDate(1,2, "12 to 3", date);
//			if (bean == null) {
//				System.out.println("Test Find by Course Subject Exam time Exam date fail");
//			} else {
//				System.out.println(bean.getId());
//				System.out.println(bean.getCourseId());
//				System.out.println(bean.getCourseName());
//				System.out.println(bean.getSubjectId());
//				System.out.println(bean.getSubjectName());
//				System.out.println(bean.getExamTime());
//				System.out.println(bean.getSemester());
//				System.out.println(bean.getExamDate());
//				System.out.println(bean.getCreatedBy());
//				System.out.println(bean.getCreatedDatetime());
//				System.out.println(bean.getModifiedBy());
//				System.out.println(bean.getModifiedDatetime());
//			}
//		} catch (ApplicationException e) {
//
//			e.printStackTrace();
//		}
//
//	}
//	
//	/**
//     * Tests get List.
//     */
//    public static void testList() {
//
//        try {
//            TimetableBean bean = new TimetableBean();
//            List list = new ArrayList();
//            list = model.list(bean, 1, 10);
//            if (list.size() < 0) {
//                System.out.println("Test list fail");
//            }
//            Iterator it = list.iterator();
//            while (it.hasNext()) {
//                bean = (TimetableBean) it.next();
//                System.out.println(bean.getId());
//				System.out.println(bean.getCourseId());
//				System.out.println(bean.getCourseName());
//				System.out.println(bean.getSubjectId());
//				System.out.println(bean.getSubjectName());
//				System.out.println(bean.getExamTime());
//				System.out.println(bean.getSemester());
//				System.out.println(bean.getExamDate());
//				System.out.println(bean.getCreatedBy());
//				System.out.println(bean.getCreatedDatetime());
//				System.out.println(bean.getModifiedBy());
//				System.out.println(bean.getModifiedDatetime());
//                               
//            }
//
//        } catch (ApplicationException e) {
//            e.printStackTrace();
//        }
//    }
// 
//
//}