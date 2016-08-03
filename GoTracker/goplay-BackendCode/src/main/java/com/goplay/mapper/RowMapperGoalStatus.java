/*
 * 
 */
package com.goplay.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.goplay.model.GoalStausModel;

/**
 * The Class RowMapperGoalStatus. This is a mapper class for goal status.
 */
public class RowMapperGoalStatus implements RowMapper {

    /*
     * (non-Javadoc)
     * 
     * @see org.springframework.jdbc.core.RowMapper#mapRow(java.sql.ResultSet,
     * int)
     */
    public Object mapRow(ResultSet rs, int rowNum) throws SQLException {

	GoalStausModel model = new GoalStausModel(rs.getString("category"), rs.getString("description"),
		rs.getString("name"), rs.getString("status"), rs.getInt("number_of_days"));
	return model;
    }

}