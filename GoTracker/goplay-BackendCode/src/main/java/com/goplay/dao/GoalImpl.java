/*
 * 
 */
package com.goplay.dao;

import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.goplay.mapper.RowMapperId;
import com.goplay.model.GoalModel;
import com.goplay.model.Response;
import com.goplay.model.User;

/**
 * The Class GoalImpl. This is the implementation of Goal Interface.
 */
@Service
public class GoalImpl implements GoalDao {

    /** The data source. */
    @Autowired
    DataSource dataSource;

    /*
     * (non-Javadoc)
     * 
     * @see com.goplay.dao.GoalDao#createGoal(com.goplay.model.GoalModel)
     */
    public int createGoal(GoalModel model) {
	try {
	    Date date = new Date();
	    String query = "insert into goals (category,description,number_of_days,start_date,user_id,created_at)values(?,?,?,?,?,?)";
	    JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
	    jdbcTemplate.update(query, new Object[] { model.getCategory(), model.getDescription(),
		    model.getNo_of_days(), model.getStart_date(), model.getUser_id(), date });

	    String find = "select id from goals where category=? and description=? and number_of_days=?  and start_date=?  and user_id=?  and created_at=? ";
	    List<Integer> id = jdbcTemplate.query(find, new RowMapperId(), new Object[] { model.getCategory(),
		    model.getDescription(), model.getNo_of_days(), model.getStart_date(), model.getUser_id(), date });

	    if (!id.isEmpty())
		return id.get(0);
	    return 0;
	} catch (Exception e) {
	    return 0;
	}

    }

    /*
     * (non-Javadoc)
     * 
     * @see com.goplay.dao.GoalDao#editGoal(com.goplay.model.GoalModel)
     */
    public Response editGoal(GoalModel model) {
	try {
	    String query = "update goals set category=?,description=?,number_of_days=?,start_date=? where id=?";
	    JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
	    jdbcTemplate.update(query, new Object[] { model.getCategory(), model.getDescription(),
		    model.getNo_of_days(), model.getStart_date(), model.getGoal_id() });

	    return new Response(200, "DONE");

	} catch (Exception e) {
	    return new Response(409, "Server Error");
	}
    }

    /*
     * (non-Javadoc)
     * 
     * @see com.goplay.dao.GoalDao#deleteGoal(int)
     */
    public Response deleteGoal(int goal_id) {
	try {
	    String query = "delete from goals where id=?";
	    JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
	    jdbcTemplate.update(query, new Object[] { goal_id });

	    return new Response(200, "DONE");

	} catch (Exception e) {
	    return new Response(409, "Server Error");
	}
    }

    /*
     * (non-Javadoc)
     * 
     * @see com.goplay.dao.GoalDao#user(com.goplay.model.User)
     */
    public int user(User model) {
	try {
	    Date date = new Date();
	    String query = "insert into users (facebook_id,name,email,date_of_birth,gender,created_at)values(?,?,?,?,?,?)";
	    JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
	    jdbcTemplate.update(query, new Object[] { model.getFacebook_id(), model.getName(), model.getEmail(),
		    model.getDate_of_birth(), model.getGender(), date });

	    String find = "select id from users where facebook_id=? and name=? and email=? and date_of_birth=? and gender=?";
	    List<Integer> id = jdbcTemplate.query(find, new RowMapperId(), new Object[] { model.getFacebook_id(),
		    model.getName(), model.getEmail(), model.getDate_of_birth(), model.getGender() });

	    if (!id.isEmpty())
		return id.get(0);
	    return 0;

	} catch (Exception e) {
	    return 0;
	}

    }
}
