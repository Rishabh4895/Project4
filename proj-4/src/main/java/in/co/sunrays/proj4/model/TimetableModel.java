/**
 * 
 */
package in.co.sunrays.proj4.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.apache.log4j.Logger;
import in.co.sunrays.proj4.bean.CourseBean;
import in.co.sunrays.proj4.bean.SubjectBean;
import in.co.sunrays.proj4.bean.TimetableBean;
import in.co.sunrays.proj4.exception.ApplicationException;
import in.co.sunrays.proj4.exception.DatabaseException;
import in.co.sunrays.proj4.exception.DuplicateRecordException;
import in.co.sunrays.proj4.util.JDBCDataSource;

/**
 * JDBC Implementation of TimetableModel
 * 
 * @author SunilOS
 * @version 1.0
 * @Copyright (c) SunilOS
 */

public class TimetableModel {

	private static Logger log = Logger.getLogger(TimetableModel.class);

	/**
	 * Find next PK of Timetable
	 * 
	 * @throws DatabaseException
	 */
	public long nextPK() throws DatabaseException {
		log.debug("model find by nextPk Started");
		long pk = 0;
		Connection conn = null;
		try {
			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement("SELECT MAX(ID) FROM ST_TIMETABLE");
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				pk = rs.getLong(1);
			}
			pstmt.close();
			rs.close();

		} catch (Exception e) {
			log.error(e);
			throw new DatabaseException("Exception in getting Timetable by Pk");
			// e.printStackTrace();
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.debug("model find by nextPk Ended");
		return pk + 1;
	}

	/**
	 * Find Timetable By PK
	 * 
	 * @throws ApplicationException
	 */
	public TimetableBean findByPK(long pk) throws ApplicationException {
		log.debug("model find by Pk Started");
		TimetableBean bean = null;
		Connection conn = null;
		try {
			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM ST_TIMETABLE WHERE ID=?");
			pstmt.setLong(1, pk);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				bean = new TimetableBean();
				bean.setId(rs.getLong(1));
				bean.setCourseName(rs.getString(2));
				bean.setCourseId(rs.getLong(3));
				bean.setSubjectName(rs.getString(4));
				bean.setSubjectId(rs.getLong(5));
				bean.setExamDate(rs.getDate(6));
				bean.setExamTime(rs.getString(7));
				bean.setSemester(rs.getInt(8));
				bean.setCreatedBy(rs.getString(9));
				bean.setCreatedDatetime(rs.getTimestamp(10));
				bean.setModifiedBy(rs.getString(11));
				bean.setModifiedDatetime(rs.getTimestamp(12));
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			log.error("Database Exception" + e);
			// e.printStackTrace();
			throw new ApplicationException("Exception:Exception in getting Timetable by Pk");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}

		log.debug("model find by Pk Ended");
		return bean;
	}

	/**
	 * Find Timetable by Subject Course
	 * 
	 * @param subjectId
	 * @param courseId
	 * @return
	 * @throws ApplicationException
	 */
	public TimetableBean findBySubjectCourse(long subjectId, long courseId) throws ApplicationException {
		log.debug("model find by SubjectCourse start");
		TimetableBean bean = null;
		Connection conn = null;
		StringBuffer sql = new StringBuffer("SELECT * FROM ST_TIMETABLE WHERE SUBJECT_ID=? AND COURSE_ID=?");
		try {
			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			pstmt.setLong(1, subjectId);
			pstmt.setLong(2, courseId);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				bean = new TimetableBean();
				bean.setId(rs.getLong(1));
				bean.setCourseName(rs.getString(2));
				bean.setCourseId(rs.getLong(3));
				bean.setSubjectName(rs.getString(4));
				bean.setSubjectId(rs.getLong(5));
				bean.setExamDate(rs.getDate(6));
				bean.setExamTime(rs.getString(7));
				bean.setSemester(rs.getInt(8));
				bean.setCreatedBy(rs.getString(9));
				bean.setCreatedDatetime(rs.getTimestamp(10));
				bean.setModifiedBy(rs.getString(11));
				bean.setModifiedDatetime(rs.getTimestamp(12));
			}
		} catch (Exception e) {
			log.error("Database Exception " + e);
			throw new ApplicationException("Exception:Exception in findBySubjectNameCourseName");

		} finally {
			JDBCDataSource.closeConnection(conn);
		}

		log.debug("model find by SubjectCourse Ended");
		return bean;
	}

	/**
	 * 
	 * Find Timetable by CourseId SubjectId and ExamTime
	 * 
	 * @param courseId
	 * @param subjectId
	 * @param examTime
	 * @return
	 * @throws ApplicationException
	 */
	public TimetableBean findByCourseExamDate(long courseId, Date examDate) throws ApplicationException {
		log.debug("model find by SubjectCourseExamTime start");

		// System.out.println("sql da" + new java.sql.Date(examDate.getTime()));
		Connection conn = null;
		// System.out.println("exam date" + examDate);
		StringBuffer sql = new StringBuffer("SELECT * FROM ST_TIMETABLE WHERE COURSE_ID=? AND EXAM_DATE=?");
		TimetableBean bean = null;
		try {
			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			pstmt.setLong(1, courseId);
			pstmt.setDate(2, new java.sql.Date(examDate.getTime()));

			ResultSet rs = pstmt.executeQuery();
			System.out.println("query" + sql);

			while (rs.next()) {
				//System.out.println("bean");

				bean = new TimetableBean();

				bean.setId(rs.getLong(1));
				bean.setCourseName(rs.getString(2));
				bean.setCourseId(rs.getLong(3));
				bean.setSubjectName(rs.getString(4));
				bean.setSubjectId(rs.getLong(5));

				bean.setExamDate(rs.getDate(6));
				bean.setExamTime(rs.getString(7));
				bean.setSemester(rs.getInt(8));
				bean.setCreatedBy(rs.getString(9));
				bean.setCreatedDatetime(rs.getTimestamp(10));
				bean.setModifiedBy(rs.getString(11));
				bean.setModifiedDatetime(rs.getTimestamp(12));
				return bean;
			}
		} catch (Exception e) {
			log.error("Database Exception " + e);
			e.printStackTrace();
			throw new ApplicationException("Exception:Exception in findBySubjectNameCourseName");

		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.debug("model find by SubjectCourse ended");
		// System.out.println("bean time"+bean.getExamTime());
		return bean;
	}

	/**
	 * 
	 * Find By CourseId SubjectId ExamTime ExamDate
	 * 
	 * @param courseId
	 * @param subjectId
	 * @param examTime
	 * @param string
	 * @return
	 * @throws ApplicationException
	 */
	public TimetableBean findByCourseSubjectExamTimeExamDate(long courseId, long subjectId, int sem, Date date)
			throws ApplicationException {
		log.debug("model find by SubjectCourseExamTime start");

		Connection conn = null;
		//System.out.println("exam time" + sem);
		StringBuffer sql = new StringBuffer(
				"SELECT * FROM ST_TIMETABLE WHERE COURSE_ID=? AND SUBJECT_ID=? AND SEMESTER =? AND EXAM_DATE=?");
		TimetableBean bean = null;
		try {
			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			pstmt.setLong(1, courseId);
			pstmt.setLong(2, subjectId);
			pstmt.setInt(3, sem);
			pstmt.setDate(4, new java.sql.Date(date.getTime()));
			ResultSet rs = pstmt.executeQuery();
			//System.out.println("query" + sql);

			while (rs.next()) {
			//	System.out.println("bean");

				bean = new TimetableBean();

				bean.setId(rs.getLong(1));
				bean.setCourseName(rs.getString(2));
				bean.setCourseId(rs.getLong(3));
				bean.setSubjectName(rs.getString(4));
				bean.setSubjectId(rs.getLong(5));

				bean.setExamDate(rs.getDate(6));
				bean.setExamTime(rs.getString(7));
				bean.setSemester(rs.getInt(8));
				bean.setCreatedBy(rs.getString(9));
				bean.setCreatedDatetime(rs.getTimestamp(10));
				bean.setModifiedBy(rs.getString(11));
				bean.setModifiedDatetime(rs.getTimestamp(12));
				return bean;
			}
		} catch (Exception e) {
			log.error("Database Exception " + e);
			//e.printStackTrace();
			 throw new ApplicationException("Exception:Exception in findBySubjectCourseExamDateTime");

		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.debug("model find by SubjectCourse ended");
		// System.out.println("bean time"+bean.getExamTime());
		return bean;
	}

	/**
	 * add Timetable
	 * 
	 * @param bean
	 * @return
	 * @throws ApplicationException
	 * @throws DuplicateRecordException
	 * @throws DatabaseException
	 */
	public long add(TimetableBean bean) throws ApplicationException, DuplicateRecordException, DatabaseException {
		log.debug("model add started");
		Connection conn = null;
		long pk = nextPK();
		CourseModel model = new CourseModel();
		CourseBean courseBean = model.findByPK(bean.getCourseId());
		bean.setCourseName(courseBean.getName());

		SubjectModel subjectModel = new SubjectModel();
		SubjectBean subjectBean = subjectModel.findByPK(bean.getSubjectId());
		bean.setSubjectName(subjectBean.getName());

		TimetableBean existSubjectCourse = findBySubjectCourse(bean.getSubjectId(), bean.getCourseId());

		if (existSubjectCourse != null) {
			throw new DuplicateRecordException("Timetable Already exist ");
		}

		TimetableBean existExamDate = findByCourseExamDate(bean.getCourseId(), bean.getExamDate());

		if (existExamDate != null) {
			throw new DuplicateRecordException("Date Already Scheduled");
		}

		TimetableBean existDate = findByCourseSubjectExamTimeExamDate(bean.getCourseId(), bean.getSubjectId(),
				bean.getSemester(), bean.getExamDate());

		if (existDate != null) {
			
			throw new DuplicateRecordException("Time already scheduled");
		}

		try {
			conn = JDBCDataSource.getConnection();
			conn.setAutoCommit(false);
			PreparedStatement pstmt = conn.prepareStatement("INSERT INTO ST_TIMETABLE VALUES(?,?,?,?,?,?,?,?,?,?,?,?)");
			pstmt.setLong(1, pk);
			pstmt.setString(2, bean.getCourseName());
			pstmt.setLong(3, bean.getCourseId());
			pstmt.setString(4, bean.getSubjectName());
			pstmt.setLong(5, bean.getSubjectId());
			pstmt.setDate(6, new java.sql.Date(bean.getExamDate().getTime()));
			pstmt.setString(7, bean.getExamTime());
			pstmt.setInt(8, bean.getSemester());
			pstmt.setString(9, bean.getCreatedBy());
			pstmt.setTimestamp(10, bean.getCreatedDatetime());
			pstmt.setString(11, bean.getModifiedBy());
			pstmt.setTimestamp(12, bean.getModifiedDatetime());
			pstmt.executeUpdate();
			conn.commit();
			pstmt.close();

		} catch (Exception e) {
			log.error("Database Exception " + e);
			try {
				conn.rollback();
			} catch (SQLException e1) {
				throw new ApplicationException("Exception:add rollback Exception");
			}
			throw new ApplicationException("Exception :Exception in add user");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}

		log.debug("model add started");
		return pk;
	}

	/**
	 * Update Timetable
	 * 
	 * @param bean
	 * @throws ApplicationException
	 * @throws DuplicateRecordException
	 */
	public void update(TimetableBean bean) throws ApplicationException, DuplicateRecordException {
		log.debug("model update started");
		Connection conn = null;
		if (bean.getCourseId() > 0) {
			CourseModel cModel = new CourseModel();
			CourseBean cBean = cModel.findByPK(bean.getCourseId());
			bean.setCourseName(cBean.getName());
		}
		if (bean.getSubjectId() > 0) {
			SubjectModel sModel = new SubjectModel();
			SubjectBean sBean = sModel.findByPK(bean.getSubjectId());
			bean.setSubjectName(sBean.getName());
		}

		TimetableBean existSubjectCourse = findBySubjectCourse(bean.getSubjectId(), bean.getCourseId());
		if (existSubjectCourse != null && existSubjectCourse.getId() != bean.getId()) {
			//System.out.println("in course subjec");
			throw new DuplicateRecordException("Timetable Already exist");

		}

		//System.out.println(bean.getCourseId() + " id " + bean.getExamDate());

		TimetableBean existExamDate = findByCourseExamDate(bean.getCourseId(), bean.getExamDate());

	//	System.out.println("bean" + (existExamDate == null));

		if (existExamDate != null && bean.getId() != existExamDate.getId()) {
			//System.out.println("in course date");
			throw new DuplicateRecordException("Date Already Scheduled");
		}

		TimetableBean existDate = findByCourseSubjectExamTimeExamDate(bean.getCourseId(), bean.getSubjectId(),
				bean.getSemester(), bean.getExamDate());
		if (existDate != null && bean.getId() != existDate.getId()) {
			//System.out.println("in last");
			throw new DuplicateRecordException("Timetable already scheduled");
		}

		try {
			conn = JDBCDataSource.getConnection();
			conn.setAutoCommit(false);
			PreparedStatement pstmt = conn.prepareStatement(
					"UPDATE ST_TIMETABLE SET COURSE_NAME=?,COURSE_ID=?,SUBJECT_NAME=?,SUBJECT_ID=?,EXAM_DATE=?,EXAM_TIME=?,SEMESTER=?,CREATED_BY=?,CREATED_DATETIME=?,MODIFIED_BY=?,MODIFIED_DATETIME=? WHERE ID=?");
			pstmt.setString(1, bean.getCourseName());
			pstmt.setLong(2, bean.getCourseId());
			pstmt.setString(3, bean.getSubjectName());
			pstmt.setLong(4, bean.getSubjectId());
			pstmt.setDate(5, new java.sql.Date(bean.getExamDate().getTime()));
			pstmt.setString(6, bean.getExamTime());
			pstmt.setInt(7, bean.getSemester());
			pstmt.setString(8, bean.getCreatedBy());
			pstmt.setTimestamp(9, bean.getCreatedDatetime());
			pstmt.setString(10, bean.getModifiedBy());
			pstmt.setTimestamp(11, bean.getModifiedDatetime());
			pstmt.setLong(12, bean.getId());
			//System.out.println("query execute");
			pstmt.executeUpdate();
			conn.commit();
			pstmt.close();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				throw new ApplicationException("Exception: update rollback exception");

			}
			throw new ApplicationException("Exception:Exception in update Timetable");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}

		log.debug("model update ended");
	}

	/**
	 * Delete a Timtable
	 * 
	 * @param bean
	 * @throws ApplicationException
	 */
	public void delete(TimetableBean bean) throws ApplicationException {
		log.debug("model delete started");
		Connection conn = null;
		StringBuffer sql = new StringBuffer("DELETE FROM ST_TIMETABLE WHERE ID=?");
		try {
			conn = JDBCDataSource.getConnection();
			conn.setAutoCommit(false);
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			pstmt.setLong(1, bean.getId());
			pstmt.executeUpdate();
			conn.commit();
			pstmt.close();
		} catch (Exception e) {
			log.error("DataBase Exception" + e.getMessage());
			try {
				conn.rollback();
			} catch (SQLException e1) {
				throw new ApplicationException("Exception:delete rollback Exception");
			}
			throw new ApplicationException("Exception:Exception in delete Timetable");

		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.debug("model delete ended");
	}

	/**
	 * Search timetable
	 * 
	 * @param bean
	 * @return
	 * @throws ApplicationException
	 */
	public List<TimetableBean> search(TimetableBean bean) throws ApplicationException {
		return search(bean, 0, 0);
	}

	/**
	 * Search with pagination
	 * 
	 * @return list : List of Roles
	 * @param bean
	 *            : Search Parameters
	 * @param pageNo
	 *            : Current Page No.
	 * @param pageSize
	 *            : Size of Page
	 * @throws ApplicationException
	 * 
	 * @throws DatabaseException
	 */
	public List<TimetableBean> search(TimetableBean bean, int pageNo, int pageSize) throws ApplicationException {
		log.debug("model search started");
		//System.out.println("model search started");
		StringBuffer sql = new StringBuffer("SELECT * FROM ST_TIMETABLE WHERE 1=1");

		if (bean != null) {
			if (bean.getId() > 0) {
				sql.append(" AND ID = " + bean.getId());
			}
			if (bean.getCourseId() > 0) {
				sql.append(" AND COURSE_ID like " + bean.getCourseId());
			}
			if (bean.getCourseName() != null && bean.getCourseName().length() > 0) {
				sql.append(" AND COURSE_NAME like '" + bean.getCourseName() + "%'");
			}
			if (bean.getSubjectName() != null && bean.getSubjectName().length() > 0) {
				sql.append(" AND SUBJECT_NAME like '" + bean.getSubjectName() + "%'");
			}
			if (bean.getSubjectId() > 0) {
				sql.append(" AND SUBJECT_ID = " + bean.getSubjectId());
			}
			if (bean.getExamTime() != null && bean.getExamTime().length() > 0) {
				sql.append(" AND EXAM_TIME like '" + bean.getExamTime() + "%'");
			}

			if (bean.getSemester() > 0) {
				sql.append(" AND  SEMESTER = " + bean.getSemester());
			}

			 System.out.println("examdate"+bean.getExamDate());
			if (bean.getExamDate() != null && !"null".equals(bean.getExamDate())) {
				//sql.append(" AND EXAM_DATE like '" + DataUtility.getSearchDate(bean.getExamDate()) + "%'");
				sql.append(" AND EXAM_DATE like '" + new java.sql.Date(bean.getExamDate().getTime()) + "%'");
			}
		}
		//System.out.println("sql "+sql);

		if (pageSize > 0) {
			pageNo = (pageNo - 1) * pageSize;
			sql.append(" LIMIT " + pageNo + ", " + pageSize);
		}
		System.out.println("sql" + sql);
		ArrayList<TimetableBean> list = new ArrayList<TimetableBean>();
		Connection conn = null;
		try {
			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				bean = new TimetableBean();
				bean.setId(rs.getLong(1));
				bean.setCourseName(rs.getString(2));
				bean.setCourseId(rs.getLong(3));
				bean.setSubjectName(rs.getString(4));
				bean.setSubjectId(rs.getLong(5));
				bean.setExamDate(rs.getDate(6));
				bean.setExamTime(rs.getString(7));
				bean.setSemester(rs.getInt(8));
				bean.setCreatedBy(rs.getString(9));
				bean.setCreatedDatetime(rs.getTimestamp(10));
				bean.setModifiedBy(rs.getString(11));
				bean.setModifiedDatetime(rs.getTimestamp(12));

				list.add(bean);
			}
			rs.close();
		} catch (Exception e) {
			log.error("Database Exception..", e);
			throw new ApplicationException("Exception : Exception in search Timetable");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}

		log.debug("Model search End");

		return list;
	}

	/**
	 * get list of timetable
	 * 
	 * @param bean
	 * @return
	 * @throws ApplicationException
	 */
	public List<TimetableBean> list(TimetableBean bean) throws ApplicationException {
		return list(bean, 0, 0);
	}

	/**
	 * 
	 * Get List Of User With Pagination
	 * 
	 * @param bean
	 * @param pageNo
	 * @param pageSize
	 * @return
	 * @throws ApplicationException
	 */
	public List<TimetableBean> list(TimetableBean bean, int pageNo, int pageSize) throws ApplicationException {
		StringBuffer sql = new StringBuffer("SELECT * FROM ST_TIMETABLE WHERE 1=1");
		List<TimetableBean> list = new ArrayList<TimetableBean>();
		if (pageSize > 0) {
			pageNo = (pageNo - 1) * pageSize;
			sql.append(" LIMIT " + pageNo + "," + pageSize);
			System.out.println(sql);
		}

		Connection conn = null;
		try {
			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				bean = new TimetableBean();
				bean.setId(rs.getLong(1));
				bean.setCourseName(rs.getString(2));
				bean.setCourseId(rs.getLong(3));
				bean.setSubjectName(rs.getString(4));
				bean.setSubjectId(rs.getLong(5));
				bean.setExamDate(rs.getDate(6));
				bean.setExamTime(rs.getString(7));
				bean.setSemester(rs.getInt(8));
				bean.setCreatedBy(rs.getString(9));
				bean.setCreatedDatetime(rs.getTimestamp(10));
				bean.setModifiedBy(rs.getString(11));
				bean.setModifiedDatetime(rs.getTimestamp(12));

				list.add(bean);
			}
			rs.close();
		} catch (Exception e) {
			log.error("Database Exception..", e);
			throw new ApplicationException("Exception : Exception in search Timetable");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}

		log.debug("Model search End");

		return list;
	}

}
