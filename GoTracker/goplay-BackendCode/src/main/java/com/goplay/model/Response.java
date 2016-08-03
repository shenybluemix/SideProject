/*
 * 
 */
package com.goplay.model;


/**
 * The Class Response.
 */
public class Response {

	/** The status. */
	int status;
	
	/** The message. */
	String message;
	
	/**
	 * Gets the status.
	 *
	 * @return the status
	 */
	public int getStatus() {
		return status;
	}
	
	/**
	 * Sets the status.
	 *
	 * @param status
	 *            the new status
	 */
	public void setStatus(int status) {
		this.status = status;
	}
	
	/**
	 * Gets the message.
	 *
	 * @return the message
	 */
	public String getMessage() {
		return message;
	}
	
	/**
	 * Sets the message.
	 *
	 * @param message
	 *            the new message
	 */
	public void setMessage(String message) {
		this.message = message;
	}
	
	/**
	 * Instantiates a new response.
	 *
	 * @param status
	 *            the status
	 * @param message
	 *            the message
	 */
	public Response(int status, String message) {
		super();
		this.status = status;
		this.message = message;
	}
	
	
	
}
