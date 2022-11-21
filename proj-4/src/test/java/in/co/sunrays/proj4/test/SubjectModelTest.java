/**
 * 
 */
package in.co.sunrays.proj4.test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import in.co.sunrays.proj4.bean.SubjectBean;
import in.co.sunrays.proj4.exception.ApplicationException;
import in.co.sunrays.proj4.exception.DatabaseException;
import in.co.sunrays.proj4.exception.DuplicateRecordException;
import in.co.sunrays.proj4.model.SubjectModel;

/**
 * Role Model Test classes
 * 
 * @author SunilOS
 * @version 1.0
 * @Copyright (c) SunilOS
 * 
 */
public class SubjectModelTest {

	/**
	 * Model object to test
	 */

	public static SubjectModel model = new SubjectModel();

	/**
	 * Main method to call test methods.
	 * 
	 * @param args
	 * @throws ParseException
	 */
	public static void main(String[] args) {

		// testAdd();
		// testDelete();
		// testUpdate();
		// testFindByPK();
		// testFindByName();
		// testSearch();
		 // testList();
	}

	/**
	 * test course add
	 */
	public static void testAdd() {
		SubjectBean bean = new SubjectBean();

		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		//bean.setId(1l);
		bean.setName(".NET");
		bean.setCourseId(1l);
		bean.setDescription("programming with c++");
		//bean.setCreatedBy("Root");
		//bean.setModifiedBy("Root");
		//bean.setCreatedDatetime(new Timestamp(new Date().getTime()));
		//bean.setModifiedDatetime(new Timestamp(new Date().getTime()));
		try {
			long pk;
			try {
				pk = model.add(bean);
				SubjectBean addedbean = model.findByPK(pk);
				if (addedbean == null) {
					System.out.println("Test add fail");
				} else {
					System.out.println("Success add");
				}
			} catch (ApplicationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (DuplicateRecordException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} catch (DatabaseException e) {

			e.printStackTrace();
		}

	}

	/**
	 * Tests delete a Subject
	 */
	public static void testDelete() {

		try {
			SubjectBean bean = new SubjectBean();
			long pk = 1L;
			bean.setId(pk);
			model.delete(bean);
			SubjectBean deletedbean = model.findByPK(pk);
			if (deletedbean != null) {
				System.out.println("Test Delete fail");
			} else {
				System.out.println("Test Delete Success");
			}
		} catch (ApplicationException e) {
			e.printStackTrace();
		}
	}
	
	 /**
     * Tests update a Subject
     */
    public static void testUpdate() {

        try {
            SubjectBean bean = model.findByPK(2L);
            bean.setName("c programming");
            model.update(bean);

            SubjectBean updatedbean = model.findByPK(1L);
            if (!"c++ programming".equals(updatedbean.getName())) {
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
     * Tests find a Subject by PK.
     */
    public static void testFindByPK() {
        try {
            SubjectBean bean = new SubjectBean();
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
     * Tests find a Subject by Name.
     */
    public static void testFindByName() {
        try {
            SubjectBean bean = new SubjectBean();
            bean = model.findByName("c++ programming");
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
     * Tests get Search
     */
    public static void testSearch() {

        try {
            SubjectBean bean = new SubjectBean();
            List list = new ArrayList();
            bean.setName("c++");
            list = model.search(bean, 0, 0);
            if (list.size() < 0) {
                System.out.println("Test Serach fail");
            }
            Iterator it = list.iterator();
            while (it.hasNext()) {
                bean = (SubjectBean) it.next();
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
            SubjectBean bean = new SubjectBean();
            List list = new ArrayList();
            list = model.list(1, 10);
            if (list.size() < 0) {
                System.out.println("Test list fail");
            }
            Iterator it = list.iterator();
            while (it.hasNext()) {
                bean = (SubjectBean) it.next();
                System.out.println(bean.getId());
                System.out.println(bean.getName());
                System.out.println(bean.getDescription());
            }

        } catch (ApplicationException e) {
            e.printStackTrace();
        }
    }


}
