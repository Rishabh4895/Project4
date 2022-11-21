/**
 * 
 */
package in.co.sunrays.proj4.exception;

/**
 * ApplicationException is propogated from service classes when an 
 * buisness logic exception occurred.
 * 
 * @author SunilOS
 * @version 1.0
 * @Copyright (c) SunilOS
 * 
 */
public class ApplicationException extends Exception {

	/**
	 * @param msg
	 * 			:error message
	 *
	 */

	public ApplicationException(String msg){
		super(msg);
	}
}
