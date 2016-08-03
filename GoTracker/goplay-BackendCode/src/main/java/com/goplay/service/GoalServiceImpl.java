/*
 * 
 */
package com.goplay.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.goplay.dao.GoalDao;
import com.goplay.model.GoalModel;
import com.goplay.model.Response;
import com.goplay.model.User;

/**
 * The Class GoalServiceImpl. This class implements the goal service API
 */
@Service
public class GoalServiceImpl implements GoalService {

    /** The goal. */
    @Autowired
    GoalDao goal;

    /*
     * (non-Javadoc)
     * 
     * @see
     * com.goplay.service.GoalService#createGoal(com.goplay.model.GoalModel)
     */
    public int createGoal(GoalModel model) {
	return goal.createGoal(model);
    }

    /*
     * (non-Javadoc)
     * 
     * @see com.goplay.service.GoalService#editGoal(com.goplay.model.GoalModel)
     */
    public Response editGoal(GoalModel model) {
	return goal.editGoal(model);
    }

    /*
     * (non-Javadoc)
     * 
     * @see com.goplay.service.GoalService#deleteGoal(int)
     */
    public Response deleteGoal(int goal_id) {
	return goal.deleteGoal(goal_id);
    }

    /*
     * (non-Javadoc)
     * 
     * @see com.goplay.service.GoalService#user(com.goplay.model.User)
     */
    public int user(User model) {
	return goal.user(model);
    }

}
