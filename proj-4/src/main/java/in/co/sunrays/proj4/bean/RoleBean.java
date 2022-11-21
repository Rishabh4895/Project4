/**
 * 
 */
package in.co.sunrays.proj4.bean;

/**
 * @author win 7
 *
 */
public class RoleBean extends BaseBean {
	/**
	 * Predefined Role Constants
	 */
	public static final int ADMIN = 1;
	public static final int STUDENT = 2;
	public static final int COLLEGE_SCHOOL = 5;
	public static final int KIOSK = 4;
	public static final int FACULTY = 3;
	/**
	 * Role name 
	 */
	private String name;
	/**
	 * Role description 
	 */
	private String description;
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}
	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}
	
	@Override
	public String getKey() {
		return id+ "";
	}
	
	@Override
	public String getValue() {
		return name;
	}
}
