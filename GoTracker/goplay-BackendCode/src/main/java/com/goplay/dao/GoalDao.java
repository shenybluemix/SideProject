/*
 * 
 */
package com.goplay.dao;

import com.goplay.model.GoalModel;
import com.goplay.model.Response;
import com.goplay.model.User;

/**
 * The Interface GoalDao. This interface provides an API methods for goal.
 */
public interface GoalDao {

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
