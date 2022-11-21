/**
 * 
 */
package in.co.sunrays.proj4.test;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import in.co.sunrays.proj4.bean.FacultyBean;
import in.co.sunrays.proj4.exception.ApplicationException;
import in.co.sunrays.proj4.exception.DatabaseException;
import in.co.sunrays.proj4.exception.DuplicateRecordException;
import in.co.sunrays.proj4.model.FacultyModel;

/**
 * FacultyModel Test Class
 * 
 * @author SunilOS
 * @version 1.0
 * @Copyright (c) SunilOS
 *
 */
public class FacultyModelTest {
	/**
     * Model object to test
     */

    public static FacultyModel model = new FacultyModel();
	public static void main(String[] args) throws DatabaseException, ParseException {
		// testAdd();
		// testDelete();
		// testUpdate();
		// testFindByPK();
		// testFindByEmailId();
		// testSearch();
		 testList();	
	}




/**
	 * test faculty add
 * @throws DatabaseException 
 * @throws ParseException 
	 */
	public static void testAdd() throws DatabaseException, ParseException {
		FacultyBean bean=new FacultyBean();
		
		SimpleDateFormat sdf=new SimpleDateFormat("dd/MM/yyyy");
		bean.setId(1l);
		bean.setFirstName("Rohit");
		bean.setLastName("malviya");
		bean.setCollegeId(1l);
		bean.setCourseId(1l);
		bean.setSubjectId(1l);
		bean.setEmailId("rohit@gmail.com");
		bean.setGender("male");
		bean.setCourseName("BCA");
		bean.setDOB(sdf.parse("22/05/1997"));
		bean.setSubject("cs");
		bean.setCollegeName("SVITS");
		bean.setMobileNo("9098161158");
		bean.setQualification("P.hd");
		bean.setCreatedBy("Root");
		bean.setModifiedBy("Root");
		bean.setCreatedDatetime(new Timestamp(new Date().getTime()));
		bean.setModifiedDatetime(new Timestamp(new Date().getTime()));
		
		try {
			long pk=model.add(bean);
			 FacultyBean addedbean = model.findByPK(pk);
	            if (addedbean == null) {
	                System.out.println("Test add fail");
	            }else{
	            	System.out.println("Success add");
	            }
		} catch (ApplicationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (DuplicateRecordException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	 /**
     * Tests update a Faculty
     */
    public static void testUpdate() {

        try {
            FacultyBean bean = model.findByPK(1L);
            bean.setFirstName("rajesh");
            model.update(bean);

            FacultyBean updatedbean = model.findByPK(1L);
            if (!"rajesh".equals(updatedbean.getFirstName())) {
                System.out.println("Test Update fail");
            }else{
            	System.out.println("Test Update Success");
            }
        } catch (ApplicationException e) {
            e.printStackTrace();
        } catch (DuplicateRecordException e) {
            e.printStackTrace();
        }
    }
    /**
     * Tests find a Course by PK.
     */
    public static void testFindByPK() {
        try {
            FacultyBean bean = new FacultyBean();
            long pk = 1L;
            bean = model.findByPK(pk);
            if (bean == null) {
                System.out.println("Test Find By PK fail");
            }else{
            System.out.println(bean.getId());
            System.out.println(bean.getFirstName());
            System.out.println(bean.getLastName());
            System.out.println(bean.getCollegeId());
            System.out.println(bean.getCollegeName());
            System.out.println(bean.getCourseName());
            System.out.println(bean.getEmailId());
            System.out.println(bean.getCourseId());
            System.out.println(bean.getGender());
            System.out.println(bean.getMobileNo());
            System.out.println(bean.getSubject());
            System.out.println(bean.getSubjectId());
            System.out.println(bean.getQualification());
            System.out.println(bean.getDOB());
            
            }
        } catch (ApplicationException e) {
            e.printStackTrace();
        }

    }
    
    /**
     * Tests delete a Faculty
     */
    public static void testDelete() {

        try {
            FacultyBean bean = new FacultyBean();
            long pk = 1L;
            bean.setId(pk);
            model.delete(bean);
            FacultyBean deletedbean = model.findByPK(pk);
            if (deletedbean != null) {
                System.out.println("Test Delete fail");
            }else{
            	System.out.println("Test Delete Success");
            }
        } catch (ApplicationException e) {
            e.printStackTrace();
        }
    }
    
    
    /**
     * Tests find a Course by Name.
     */
    public static void testFindByEmailId() {
        try {
            FacultyBean bean = new FacultyBean();
            bean = model.findByEmailId("rohit@gmail.com");
            if (bean == null) {
                System.out.println("Test Find By name fail");
            }else{
            	 System.out.println(bean.getId());
                 System.out.println(bean.getFirstName());
                 System.out.println(bean.getLastName());
                 System.out.println(bean.getCollegeId());
                 System.out.println(bean.getCollegeName());
                 System.out.println(bean.getCourseName());
                 System.out.println(bean.getEmailId());
                 System.out.println(bean.getCourseId());
                 System.out.println(bean.getGender());
                 System.out.println(bean.getMobileNo());
                 System.out.println(bean.getSubject());
                 System.out.println(bean.getSubjectId());
                 System.out.println(bean.getQualification());
                 System.out.println(bean.getDOB());
                 
            }
           
        } catch (ApplicationException e) {
            e.printStackTrace();
        }
    }
    
    /**
     * Tests get Search
     */
    public static void testSearch() {

        try {
            FacultyBean bean = new FacultyBean();
            List list = new ArrayList();
            bean.setFirstName("Rohit");
            list = model.search(bean, 0, 0);
            if (list.size() < 0) {
                System.out.println("Test Serach fail");
            }
            Iterator it = list.iterator();
            while (it.hasNext()) {
                bean = (FacultyBean)it.next();
               System.out.println(bean.getId());
               System.out.println(bean.getFirstName());
               System.out.println(bean.getLastName());
               System.out.println(bean.getCollegeId());
               System.out.println(bean.getCollegeName());
               System.out.println(bean.getCourseName());
               System.out.println(bean.getEmailId());
               System.out.println(bean.getCourseId());
               System.out.println(bean.getGender());
               System.out.println(bean.getMobileNo());
               System.out.println(bean.getSubject());
               System.out.println(bean.getSubjectId());
               System.out.println(bean.getQualification());
               System.out.println(bean.getDOB());
                
            }

        } catch (ApplicationException e) {
            e.printStackTrace();
        }

    }
    /**
     * Tests get List.
     */
    public static void testList() {

        try {
            FacultyBean bean = new FacultyBean();
            List list = new ArrayList();
            list = model.list(1, 10);
            if (list.size() < 0) {
                System.out.println("Test list fail");
            }
            Iterator it = list.iterator();
            while (it.hasNext()) {
                bean = (FacultyBean) it.next();
                System.out.println(bean.getId());
                System.out.println(bean.getFirstName());
                System.out.println(bean.getLastName());
                System.out.println(bean.getCollegeId());
                System.out.println(bean.getCollegeName());
                System.out.println(bean.getCourseName());
                System.out.println(bean.getEmailId());
                System.out.println(bean.getCourseId());
                System.out.println(bean.getGender());
                System.out.println(bean.getMobileNo());
                System.out.println(bean.getSubject());
                System.out.println(bean.getSubjectId());
                System.out.println(bean.getQualification());
                System.out.println(bean.getDOB());
                
            }

        } catch (ApplicationException e) {
            e.printStackTrace();
        }
    }
 
    
}