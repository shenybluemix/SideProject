/*
 * 
 */
package com.goplay.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.goplay.dao.SuccessDao;
import com.goplay.model.GoalStausModel;
import com.goplay.model.Response;
import com.goplay.model.SuccessModel;

/**
 * The Class SuccessServiceImpl. This Class implements success service API
 */
@Service
public class SuccessServiceImpl implements SuccessService {

    /** The success. */
    @Autowired
    SuccessDao success;

    /*
     * (non-Javadoc)
     * 
     * @see com.goplay.service.SuccessService#addSuccess(com.goplay.model.
     * SuccessModel)
     */
    public Response addSuccess(SuccessModel model) {
	return success.addSuccess(model);
    }

    /*
     * (non-Javadoc)
     * 
     * @see com.goplay.service.SuccessService#editSuccess(com.goplay.model.
     * SuccessModel)
     */
    public Response editSuccess(SuccessModel model) {
	return success.editSuccess(model);
    }

    /*
     * (non-Javadoc)
     * 
     * @see com.goplay.service.SuccessService#get(java.lang.String)
     */
    public List<GoalStausModel> get(String id) {
	return success.get(id);
    }
}
