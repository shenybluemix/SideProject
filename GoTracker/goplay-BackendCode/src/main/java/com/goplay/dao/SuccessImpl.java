/*
 * 
 */
package com.goplay.dao;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.goplay.mapper.RowMapperGoalStatus;
import com.goplay.model.GoalStausModel;
import com.goplay.model.Response;
import com.goplay.model.SuccessModel;

/**
 * The Class SuccessImpl. This is the implementation of Success interface.
 */
@Service
public class SuccessImpl implements SuccessDao {

    /** The data source. */
    @Autowired
    DataSource dataSource;

    /*
     * (non-Javadoc)
     * 
     * @see com.goplay.dao.SuccessDao#addSuccess(com.goplay.model.SuccessModel)
     */
    public Response addSuccess(SuccessModel model) {
	try {
	    String query = "insert into goal_status (user_id,goal_id,status,date)values(?,?,?,?)";
	    JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
	    jdbcTemplate.update(query,
		    new Object[] { model.getUser_id(), model.getGoal_id(), model.getStaus(), model.getDate() });

	    return new Response(200, "DONE");

	} catch (Exception e) {
	    return new Response(409, "Server Error");
	}

    }

    /*
     * (non-Javadoc)
     * 
     * @see com.goplay.dao.SuccessDao#editSuccess(com.goplay.model.SuccessModel)
     */
    public Response editSuccess(SuccessModel model) {
	try {
	    String query = "update goal_status set user_id=?,goal_id=?,status=?,date=? where id=?";
	    JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
	    jdbcTemplate.update(query, new Object[] { model.getUser_id(), model.getGoal_id(), model.getStaus(),
		    model.getDate(), model.getId() });
	    return new Response(200, "DONE");
	} catch (Exception e) {
	    return new Response(409, "Server Error");
	}
    }

    /*
     * (non-Javadoc)
     * 
     * @see com.goplay.dao.SuccessDao#get(java.lang.String)
     */
    public List<GoalStausModel> get(String id) {

	String query = "select name,status,category,number_of_days,description from goal_status, users,goals where goal_status.user_id=users.id and goal_status.user_id="
		+ id + " and goals.user_id=users.id and goals.id=goal_status.goal_id;";
	JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
	List<GoalStausModel> stautsList = jdbcTemplate.query(query, new RowMapperGoalStatus());
	return stautsList;

    }

}
