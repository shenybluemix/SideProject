/*
 * 
 */
package com.goplay.dao;

import java.util.List;

import com.goplay.model.GoalStausModel;
import com.goplay.model.Response;
import com.goplay.model.SuccessModel;

/**
 * The Interface SuccessDao. This interface provides API for success.
 */
public interface SuccessDao {

    /**
     * Adds the success.
     *
     * @param model
     *            the model
     * @return the response
     */
    public Response addSuccess(SuccessModel model);

    /**
     * Edits the success.
     *
     * @param model
     *            the model
     * @return the response
     */
    public Response editSuccess(SuccessModel model);

    /**
     * Gets the.
     *
     * @param id
     *            the id
     * @return the list
     */
    public List<GoalStausModel> get(String id);

}
