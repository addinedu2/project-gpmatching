package com.gpmatching.config;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import com.gpmatching.mapper.UserMapper;
import com.gpmatching.service.AccountServiceImpl;
import com.gpmatching.service.AccountService;
import com.gpmatching.service.MatchingBoardService;
import com.gpmatching.service.MatchingBoardServiceImpl;
import com.gpmatching.service.MatchingCommentService;
import com.gpmatching.service.MatchingCommentServiceImpl;
import com.gpmatching.service.MatchingReviewService;
import com.gpmatching.service.MatchingReviewServiceImpl;


@Configuration
@MapperScan(basePackages = { "com.gpmatching.mapper"}) //xml  설정의 <mybatis:scan 을 대신하는 annotation
public class RootConfiguration implements ApplicationContextAware {
	
	private ApplicationContext applicationContext;
	
	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		this.applicationContext = applicationContext;
	}
	
	@Bean
	public BasicDataSource dbcpDatSource() {
		
		BasicDataSource dataSource = new BasicDataSource();
		dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
		dataSource.setUrl("jdbc:mysql://127.0.0.1:3306/gpmatchingdb" );
		dataSource.setUsername("gpmatching");
		dataSource.setPassword("gpmatching");
		dataSource.setMaxTotal(10);
		dataSource.setMaxIdle(5);
		dataSource.setMaxWaitMillis(-1);
		
		return dataSource;
	}
	
	@Bean
	public SqlSessionFactory sqlSessionFactory() throws Exception {
		
		SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
		factoryBean.setDataSource(dbcpDatSource());
		factoryBean.setConfigLocation(new ClassPathResource("mybatis-config.xml"));
		SqlSessionFactory sessionFactory = factoryBean.getObject();
		
		return sessionFactory;
		
	}
	
	@Bean
	public MatchingBoardService matchingBoardService() {
		
		return new MatchingBoardServiceImpl();
	}
	
	@Bean
	public MatchingReviewService matchingReviewService() {
		
		return new MatchingReviewServiceImpl();
	}
	
	@Bean
	public MatchingCommentService matchingCommentService() {
		
		MatchingCommentService matchingCommentService = new MatchingCommentServiceImpl();
		
		return matchingCommentService;
	}
	
	@Bean
	public AccountServiceImpl accountService() {
		AccountServiceImpl accountService = new AccountServiceImpl();
		accountService.setUsermapper(applicationContext.getBean(UserMapper.class));
		return accountService;
	}
	

}
	
	

