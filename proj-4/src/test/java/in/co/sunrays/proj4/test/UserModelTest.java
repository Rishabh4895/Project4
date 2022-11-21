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

import javax.mail.MessagingException;

import in.co.sunrays.proj4.bean.UserBean;
import in.co.sunrays.proj4.exception.ApplicationException;
import in.co.sunrays.proj4.exception.DuplicateRecordException;
import in.co.sunrays.proj4.exception.RecordNotFoundException;
import in.co.sunrays.proj4.model.UserModel;

/**
 * UserModel Test Class
 * 
 * @author SunilOS
 * @version 1.0
 * @Copyright (c) SunilOS
 *
 */
public class UserModelTest {

	public static UserModel model = new UserModel();

	/**
	 * @param args
	 * @throws ParseException
	 * @throws DuplicateRecordException
	 * @throws ApplicationException
	 */
	public static void main(String[] args) throws ParseException, ApplicationException, DuplicateRecordException {
		// testAdd();
		// testDelete();
		// testUpdate();
		// testFindByPk();
		// testFindByLogin();
		// testSearch();
		// testGetRoles();
		// testList();
		 testAuthenticate();
		// testResetPassword();
		// testRegisterUser();
		// testChangePassword();
		// testforgetPassword();
	}

	/**
	 * Tests add a User.
	 * 
	 * @throws ParseException
	 * @throws DuplicateRecordException
	 */
	public static void testAdd() throws ParseException, ApplicationException, DuplicateRecordException {
		try {
			UserBean bean = new UserBean();
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
			bean.setId(3);
			bean.setFirstName("Rohit ghjk");
			bean.setLastName("maythujklviya");
			bean.setLogin("roghjhisghjkdgfdfdsat5@gmail.com");
			bean.setPassword("12345");
			Date date = sdf.parse("22-06-1997");
			System.out.println("Date is : " + date);
			bean.setDob(date);
			bean.setMobileNo("3254666777");
			bean.setRoleId(2);
			bean.setUnSuccessfulLogin(3);
			bean.setGender("male");
			bean.setLastLogin(new Timestamp(new Date().getTime()));
			bean.setLock("Inactive");
			// bean.setConfirmPassword("12345");
			// bean.setCreatedBy("Rohit");
			long pk = model.add(bean);
			UserBean addedBean = model.findByPK(pk);
			if (addedBean == null) {
				System.out.println("Test add fail");
			} else {
				System.out.println("Test add Successfully");
			}
		} catch (ApplicationException e) {
			e.printStackTrace();
		}

	}

	/**
	 * Tests delete a User.
	 * 
	 * @throws ApplicationException
	 */
	public static void testDelete() throws ApplicationException {
		try {
			UserBean bean = new UserBean();
			long pk = 40L;
			bean.setId(pk);
			model.delete(bean);
			System.out.println("Test Deleted Successfully : " + bean.getId());
			UserBean deletedBean = model.findByPK(pk);
			if (deletedBean == null) {
				System.out.println("Test Deleted Fails");
				System.out.println("PK not exist");
			} else {
				System.out.println("success");
			}
		} catch (ApplicationException e) {
			e.printStackTrace();
		}
	}

	/**
	 * Tests Update a user
	 */
	public static void testUpdate() {
		try {
			UserBean bean = model.findByPK(39L);
			bean.setFirstName("Rohit k");
			bean.setLastName("malviya");
			bean.setLogin("rohitparda12@gmail.com");
			bean.setPassword("new");
			model.update(bean);
			UserBean updatedBean = model.findByPK(39L);
			if (!"rohitparda12@gmail.com".equals(updatedBean.getLogin())) {
				System.out.println("Test Update fail");
			} else {
				System.out.println("success");
			}
		} catch (ApplicationException e) {
			e.printStackTrace();

		} catch (DuplicateRecordException ex) {
			ex.printStackTrace();
		}

	}

	/**
	 * Tests find a User by PK.
	 */
	public static void testFindByPk() {
		long pk = 1L;
		try {
			UserBean bean = model.findByPK(pk);
			if (bean == null) {
				System.out.println("Test Find By Pk Fails");
			} else {
				System.out.println(bean.getId());
				System.out.println(bean.getFirstName());
				System.out.println(bean.getLastName());
				System.out.println(bean.getLogin());
				System.out.println(bean.getPassword());
				System.out.println(bean.getDob());
				System.out.println(bean.getRoleId());
				System.out.println(bean.getUnSuccessfulLogin());
				System.out.println(bean.getGender());
				System.out.println(bean.getLastLogin());
				// System.out.println(bean.getLock());
			}
		} catch (ApplicationException e) {
			e.printStackTrace();
		}
	}

	/**
	 * Tests find a User by Login.
	 */
	public static void testFindByLogin() {
		UserBean bean = new UserBean();
		try {
			bean = model.findByLogin("rr");
			if (bean == null) {
				System.out.println("TestFindByLogin fails");
			} else {
				System.out.println(bean.getId());
				System.out.println(bean.getFirstName());
				System.out.println(bean.getLastName());
				System.out.println(bean.getLogin());
				System.out.println(bean.getPassword());
				System.out.println(bean.getDob());
				System.out.println(bean.getRoleId());
				System.out.println(bean.getUnSuccessfulLogin());
				System.out.println(bean.getGender());
				System.out.println(bean.getLastLogin());
				System.out.println(bean.getLock());
			}
		} catch (ApplicationException e) {
			e.printStackTrace();
		}
	}

	/**
	 * Tests Search a user
	 */
	public static void testSearch() {
		UserBean bean = new UserBean();
		List list = new ArrayList();
		bean.setFirstName("Ram");
		try {
			System.out.println("Search Started");
			list = model.search(bean);
			if (list.size() < 0) {
				System.out.println("Test Search Fails");
			}
			Iterator it = list.iterator();
			// System.out.println("List get");
			while (it.hasNext()) {
				UserBean bean1 = (UserBean) it.next();
				System.out.println(bean1.getId());
				System.out.println(bean1.getFirstName());
				System.out.println(bean1.getLastName());
				System.out.println(bean1.getLogin());
				System.out.println(bean1.getPassword());
				System.out.println(bean1.getDob());
				System.out.println(bean1.getRoleId());
				System.out.println(bean1.getUnSuccessfulLogin());
				System.out.println(bean1.getGender());
				System.out.println(bean1.getLastLogin());
				System.out.println(bean1.getLock());

			}
			// System.out.println("Search End");
		} catch (ApplicationException e) {
			e.printStackTrace();
		}

	}

	/**
	 * Test a list
	 */
	public static void testList() {

		UserBean bean = new UserBean();
		List list = new ArrayList();
		try {
			list = model.list(1, 10);
			if (list.size() < 0) {
				System.out.println("List test fails");
			} else {
				Iterator it = list.iterator();
				while (it.hasNext()) {
					bean = (UserBean) it.next();
					System.out.println(bean.getId());
					System.out.println(bean.getFirstName());
					System.out.println(bean.getLastName());
					System.out.println(bean.getLogin());
					System.out.println(bean.getPassword());
					System.out.println(bean.getDob());
					System.out.println(bean.getRoleId());
					System.out.println(bean.getUnSuccessfulLogin());
					System.out.println(bean.getGender());
					System.out.println(bean.getLastLogin());
					System.out.println(bean.getLock());
					System.out.println(bean.getMobileNo());
					System.out.println(bean.getCreatedBy());
					System.out.println(bean.getModifiedBy());
					System.out.println(bean.getCreatedDatetime());
					System.out.println(bean.getModifiedDatetime());
				}
			}
		} catch (ApplicationException e) {
			e.printStackTrace();
		}

	}

	/**
	 * Tests get Roles.
	 */
	public static void testGetRoles() {

		UserBean bean = new UserBean();
		bean.setRoleId(1);
		List list = new ArrayList();

		try {
			list = model.getRoles(bean);
			if (list.size() < 0) {
				System.out.println("test get roles failed");
			}
			Iterator it = list.iterator();
			while (it.hasNext()) {
				bean = (UserBean) it.next();
				System.out.println(bean.getId());
				System.out.println(bean.getFirstName());
				System.out.println(bean.getLastName());
				System.out.println(bean.getLogin());
				System.out.println(bean.getPassword());
				System.out.println(bean.getDob());
				System.out.println(bean.getRoleId());
				System.out.println(bean.getUnSuccessfulLogin());
				System.out.println(bean.getGender());
				System.out.println(bean.getLastLogin());
				System.out.println(bean.getLock());
				System.out.println(bean.getMobileNo());
				System.out.println(bean.getCreatedBy());
				System.out.println(bean.getModifiedBy());
				System.out.println(bean.getCreatedDatetime());
				System.out.println(bean.getModifiedDatetime());
			}
		} catch (ApplicationException e) {

			e.printStackTrace();
		}

	}

	/**
	 * Tests authenticate User.
	 */
	public static void testAuthenticate() {
		UserBean bean = new UserBean();
		bean.setLogin("rr");
		bean.setPassword("rr1");
		try {
			bean = model.authenticate(bean.getLogin(), bean.getPassword());

			if (bean != null) {
				System.out.println("Successfully login");

			} else {
				System.out.println("Invalid login Id & password");
			}
		} catch (ApplicationException e) {

			e.printStackTrace();
		}

	}

	/**
	 * Tests add a User register
	 * 
	 * @throws ParseException
	 * @throws MessagingException
	 */
	public static void testRegisterUser() throws ParseException, MessagingException {
		try {
			UserBean bean = new UserBean();
			SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");

			// bean.setId(8L);
			bean.setFirstName("vipin");
			// bean.setLastName("kumawat");
			bean.setLogin("kanjitch11ou1dhay@gmail.com");
			bean.setPassword("rwefwefr");
			bean.setConfirmPassword("rwefwefr");
			bean.setDob(sdf.parse("11/20/2015"));
			bean.setGender("Male");
			bean.setRoleId(2);
			long pk = model.registerUser(bean);
			System.out.println("Successfully register" + pk);
			System.out.println(bean.getFirstName());
			System.out.println(bean.getLogin());
			System.out.println(bean.getLastName());
			System.out.println(bean.getDob());
			UserBean registerbean = model.findByPK(pk);
			if (registerbean == null) {
				System.out.println("Test registration fail");
			} else {
				System.out.println("Test registration Success");
			}
		} catch (ApplicationException e) {
			e.printStackTrace();
		} catch (DuplicateRecordException e) {
			e.printStackTrace();
		}
	}

	/**
	 * Tests changepassword
	 * 
	 * @throws MessagingException
	 * 
	 * @throws ParseException
	 */
	public static void testChangePassword() throws MessagingException {

		try {
			UserBean bean = model.findByLogin("r@gmail.com");
			String oldPassword = bean.getPassword();
			bean.setId(15l);
			bean.setPassword("88");
			bean.setConfirmPassword("kk");
			String newPassword = bean.getPassword();
			try {
				model.changePassword(15L, oldPassword, newPassword);
				System.out.println("password has been change successfully");
			} catch (RecordNotFoundException e) {
				e.printStackTrace();
			}

		} catch (ApplicationException e) {
			e.printStackTrace();
		}

	}

	/**
	 * Tests fogetPassword
	 * 
	 * @throws ParseException
	 */
	public static void testforgetPassword() {
		try {
			boolean b = model.forgetPassword("rohitmalviya555@gmail.com");

			System.out.println("Success : Test Forget Password Success");

		} catch (RecordNotFoundException e) {
			e.printStackTrace();
		} catch (ApplicationException e) {
			e.printStackTrace();
		} catch (MessagingException e) {

			e.printStackTrace();
		}
	}

	public static void testResetPassword() {
		UserBean bean = new UserBean();
		try {
			bean = model.findByLogin("ranjitchoudhary20@gmail.com");
			if (bean != null) {
				boolean pass = model.resetPassword(bean);
				if (pass == false) {
					System.out.println("Test Reset Password Fail");
				} else {
					System.out.println("Test Reset password Success");
				}
			}
		} catch (ApplicationException e) {
			e.printStackTrace();
		}
	}

}
