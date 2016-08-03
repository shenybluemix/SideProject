/*
 * 
 */
package com.goplay.controller;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.goplay.model.GoalModel;
import com.goplay.model.Response;
import com.goplay.model.User;
import com.goplay.service.GoalService;

/**
 * The Class Goal. This Class provides various end points for goals.
 */
@Controller
public class Goal {

    /** The goal. */
    @Autowired
    GoalService goal;

    /**
     * Creates the goal.
     *
     * @param model
     *            the model
     * @return the JSON object
     */
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject createGoal(GoalModel model) {
	JSONObject jsonObject = new JSONObject();
	int id = goal.createGoal(model);
	if (id == 0) {
	    Response response = new Response(409, "Server Error");
	    jsonObject.put("result", response);
	} else {
	    model.setGoal_id(id);
	    jsonObject.put("result", model);
	}

	return jsonObject;

    }

    /**
     * Edits the goal.
     *
     * @param model
     *            the model
     * @return the JSON object
     */
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject editGoal(GoalModel model) {
	JSONObject jsonObject = new JSONObject();
	Response response = goal.editGoal(model);
	if (response.getStatus() == 0)
	    jsonObject.put("result", response);
	else
	    jsonObject.put("result", model);

	return jsonObject;
    }

    /**
     * Delete goal.
     *
     * @param goal_id
     *            the goal id
     * @return the JSON object
     */
    @RequestMapping(value = "/delete", method = RequestMethod.DELETE)
    @ResponseBody
    public JSONObject deleteGoal(int goal_id) {
	JSONObject jsonObject = new JSONObject();
	Response response = goal.deleteGoal(goal_id);
	jsonObject.put("result", response);
	return jsonObject;
    }

    /**
     * Facebooklogin.
     *
     * @param model
     *            the model
     * @return the JSON object
     */
    @RequestMapping(value = "/facebookLogin", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject facebooklogin(User model) {
	JSONObject jsonObject = new JSONObject();
	int id = goal.user(model);
	if (id == 0) {
	    Response response = new Response(409, "Server Error");
	    jsonObject.put("result", response);
	} else {
	    model.setId(id);
	    jsonObject.put("result", model);
	}

	return jsonObject;

    }

}
