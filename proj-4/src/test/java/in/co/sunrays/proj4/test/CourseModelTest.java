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

import in.co.sunrays.proj4.bean.CourseBean;
import in.co.sunrays.proj4.exception.ApplicationException;
import in.co.sunrays.proj4.exception.DuplicateRecordException;
import in.co.sunrays.proj4.model.CourseModel;

/**
 * @author hello
 *
 */
public class CourseModelTest {
	/**
     * Model object to test
     */

    public static CourseModel model = new CourseModel();

    /**
     * Main method to call test methods.
     * 
     * @param args
     * @throws ParseException
     */
    public static void main(String[] args) throws ParseException {
        // testAdd();
        // testDelete();
        // testUpdate();
    	// testFindByPK();
        // testFindByName();
       //  testSearch();
        testList();

    }
    
    
    /**
	 * test course add
	 */
	public static void testAdd() {
		CourseBean bean=new CourseBean();
		
		SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy");
		bean.setId(1l);
		bean.setName("BCA");
		bean.setDuration("3 year");
		bean.setDescription("Bachelor of computer application");
		bean.setCreatedBy("Root");
		bean.setModifiedBy("Root");
		bean.setCreatedDatetime(new Timestamp(new Date().getTime()));
		bean.setModifiedDatetime(new Timestamp(new Date().getTime()));
		try {
			long pk=model.add(bean);
			 CourseBean addedbean = model.findByPK(pk);
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
     * Tests delete a Course
     */
    public static void testDelete() {

        try {
            CourseBean bean = new CourseBean();
            long pk = 1L;
            bean.setId(pk);
            model.delete(bean);
            CourseBean deletedbean = model.findByPK(pk);
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
     * Tests update a Course
     */
    public static void testUpdate() {

        try {
            CourseBean bean = model.findByPK(1L);
            bean.setName("MCA");
            model.update(bean);

            CourseBean updatedbean = model.findByPK(1L);
            if (!"MCA".equals(updatedbean.getName())) {
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
            CourseBean bean = new CourseBean();
            long pk = 1L;
            bean = model.findByPK(pk);
            if (bean == null) {
                System.out.println("Test Find By PK fail");
            }else{
            System.out.println(bean.getId());
            System.out.println(bean.getName());
            System.out.println(bean.getDescription());
            }
        } catch (ApplicationException e) {
            e.printStackTrace();
        }

    }
    /**
     * Tests find a Course by Name.
     */
    public static void testFindByName() {
        try {
            CourseBean bean = new CourseBean();
            bean = model.findByName("mca");
            if (bean == null) {
                System.out.println("Test Find By name fail");
            }
            System.out.println(bean.getId());
            System.out.println(bean.getName());
            System.out.println(bean.getDescription());
        } catch (ApplicationException e) {
            e.printStackTrace();
        }
    }
    
    /**
     * Tests get Search
     */
    public static void testSearch() {

        try {
            CourseBean bean = new CourseBean();
            List list = new ArrayList();
            bean.setName("bca");
            list = model.search(bean, 0, 0);
            if (list.size() < 0) {
                System.out.println("Test Serach fail");
            }
            Iterator it = list.iterator();
            while (it.hasNext()) {
                bean = (CourseBean) it.next();
                System.out.println(bean.getId());
                System.out.println(bean.getName());
                System.out.println(bean.getDescription());
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
            CourseBean bean = new CourseBean();
            List list = new ArrayList();
            list = model.list(1, 10);
            if (list.size() < 0) {
                System.out.println("Test list fail");
            }
            Iterator it = list.iterator();
            while (it.hasNext()) {
                bean = (CourseBean) it.next();
                System.out.println(bean.getId());
                System.out.println(bean.getName());
                System.out.println(bean.getDescription());
            }

        } catch (ApplicationException e) {
            e.printStackTrace();
        }
    }
 
    


}
