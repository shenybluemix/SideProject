package com.goplay.conf;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.goplay.service.GoalService;
import com.goplay.service.GoalServiceImpl;
import com.goplay.service.SuccessService;
import com.goplay.service.SuccessServiceImpl;

/**
 * The Class GoplayConfiguration. This class handles database connection. The
 * values are coming from config.properties file.
 */
@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "com.goplay")
public class GoplayConfiguration {

    String result = "";
    InputStream inputStream;

    /**
     * Gets the data source.
     *
     * @return the data source
     * @throws IOException
     */
    @Bean
    public DataSource getDataSource() throws IOException {
	DriverManagerDataSource dataSource = new DriverManagerDataSource();
	Properties prop = new Properties();
	String propFileName = "config.propertise";

	inputStream = getClass().getClassLoader().getResourceAsStream(propFileName);

	if (inputStream != null) {
	    prop.load(inputStream);
	} else {
	    throw new FileNotFoundException("property file '" + propFileName + "' not found in the classpath");
	}

	String url = prop.getProperty("database.url");
	String driver = prop.getProperty("database.driver");
	String username = prop.getProperty("database.username");
	String password = prop.getProperty("database.password");

	dataSource.setDriverClassName(driver);
	dataSource.setUrl(url);
	dataSource.setUsername(username);
	dataSource.setPassword(password);

	return dataSource;
    }

    /**
     * Goal.
     *
     * @return the goal service
     */
    @Bean
    public GoalService goal() {
	return new GoalServiceImpl();
    }

    /**
     * Success.
     *
     * @return the success service
     */
    @Bean
    public SuccessService success() {
	return new SuccessServiceImpl();
    }

}
