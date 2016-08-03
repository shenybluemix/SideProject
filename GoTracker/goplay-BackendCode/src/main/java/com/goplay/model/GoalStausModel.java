/*
 * 
 */
package com.goplay.model;


/**
 * The Class GoalStausModel.
 */
public class GoalStausModel {

	/** The status. */
	String category,description,name,status;
	
	/** The no of days. */
	int no_of_days;
	
	/**
	 * Gets the category.
	 *
	 * @return the category
	 */
	public String getCategory() {
		return category;
	}
	
	/**
	 * Sets the category.
	 *
	 * @param category
	 *            the new category
	 */
	public void setCategory(String category) {
		this.category = category;
	}
	
	/**
	 * Gets the description.
	 *
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}
	
	/**
	 * Sets the description.
	 *
	 * @param description
	 *            the new description
	 */
	public void setDescription(String description) {
		this.description = description;
	}
	
	/**
	 * Gets the name.
	 *
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	
	/**
	 * Sets the name.
	 *
	 * @param name
	 *            the new name
	 */
	public void setName(String name) {
		this.name = name;
	}
	
	/**
	 * Gets the status.
	 *
	 * @return the status
	 */
	public String getStatus() {
		return status;
	}
	
	/**
	 * Sets the status.
	 *
	 * @param status
	 *            the new status
	 */
	public void setStatus(String status) {
		this.status = status;
	}
	
	/**
	 * Gets the no of days.
	 *
	 * @return the no of days
	 */
	public int getNo_of_days() {
		return no_of_days;
	}
	
	/**
	 * Sets the no of days.
	 *
	 * @param no_of_days
	 *            the new no of days
	 */
	public void setNo_of_days(int no_of_days) {
		this.no_of_days = no_of_days;
	}
	
	/**
	 * Instantiates a new goal staus model.
	 *
	 * @param category
	 *            the category
	 * @param description
	 *            the description
	 * @param name
	 *            the name
	 * @param status
	 *            the status
	 * @param no_of_days
	 *            the no of days
	 */
	public GoalStausModel(String category, String description, String name, String status, int no_of_days) {
		super();
		this.category = category;
		this.description = description;
		this.name = name;
		this.status = status;
		this.no_of_days = no_of_days;
	}
	
	
	
	
}
