/*
 * 
 */
package com.goplay.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

/**
 * The Class RowMapperId. It provies the mapper id
 */
public class RowMapperId implements RowMapper {

    /*
     * (non-Javadoc)
     * 
     * @see org.springframework.jdbc.core.RowMapper#mapRow(java.sql.ResultSet,
     * int)
     */
    public Object mapRow(ResultSet rs, int rowNum) throws SQLException {

	return rs.getInt(1);
    }

}