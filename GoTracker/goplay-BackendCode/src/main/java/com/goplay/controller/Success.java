/*
 * 
 */
package com.goplay.controller;

import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.goplay.model.GoalStausModel;
import com.goplay.model.Response;
import com.goplay.model.SuccessModel;
import com.goplay.service.SuccessService;

/**
 * The Class Success. This class provides various end points for success.
 */
@Controller
public class Success {

    /** The success. */
    @Autowired
    SuccessService success;

    /**
     * Adds the success.
     *
     * @param model
     *            the model
     * @return the JSON object
     */
    @RequestMapping(value = "/addSuccess", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject addSuccess(SuccessModel model) {
	JSONObject jsonObject = new JSONObject();

	Response response = success.addSuccess(model);
	if (response.getStatus() == 200)
	    jsonObject.put("result", model);
	else
	    jsonObject.put("result", response);
	return jsonObject;

    }

    /**
     * Edits the success.
     *
     * @param model
     *            the model
     * @return the JSON object
     */
    @RequestMapping(value = "/editSuccess", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject editSuccess(SuccessModel model) {
	JSONObject jsonObject = new JSONObject();
	Response response = success.editSuccess(model);
	if (response.getStatus() == 200)
	    jsonObject.put("result", model);
	else
	    jsonObject.put("result", response);
	return jsonObject;

    }

    /**
     * Gets the.
     *
     * @param id
     *            the id
     * @return the JSON object
     */
    @RequestMapping(value = "/get", method = RequestMethod.GET)
    @ResponseBody
    public JSONObject get(@RequestParam(defaultValue = "") String id) {
	JSONObject jsonObject = new JSONObject();
	List<GoalStausModel> statusList = success.get(id);
	jsonObject.put("result", statusList);
	return jsonObject;

    }

}
