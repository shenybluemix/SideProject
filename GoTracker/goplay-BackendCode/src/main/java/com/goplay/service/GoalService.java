/*
 * 
 */
package com.goplay.service;

import com.goplay.model.GoalModel;
import com.goplay.model.Response;
import com.goplay.model.User;

/**
 * The Interface GoalService. This is a goal service API
 */
public interface GoalService {

    /**
     * Creates the goal.
     *
     * @param model
     *            the model
     * @return the int
     */
    public int createGoal(GoalModel model);

    /**
     * Edits the goal.
     *
     * @param model
     *            the model
     * @return the response
     */
    public Response editGoal(GoalModel model);

    /**
     * Delete goal.
     *
     * @param goal_id
     *            the goal id
     * @return the response
     */
    public Response deleteGoal(int goal_id);

    /**
     * User.
     *
     * @param model
     *            the model
     * @return the int
     */
    public int user(User model);

}
