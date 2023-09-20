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

@Configuration
@MapperScan(basePackages = {"com.gpmatching.mapper"})
public class RootConfiguration implements ApplicationContextAware{
	
	private ApplicationContext applicationContext;
	@Override
//	public void setApplicationContext(org.springframework.context.ApplicationContext applicationContext)
//			throws BeansException {
//		this.applicationContext = applicationContext;}
		
		public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
			this.applicationContext = applicationContext;
		}
		
	

	@Bean
	public BasicDataSource dbcpDataSource() {
		BasicDataSource dataSource = new BasicDataSource();
		dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
		dataSource.setUrl("jdbc:mysql://127.0.0.1:3306/gpmatchingdb");
		dataSource.setUsername("gpmatching");
		dataSource.setPassword("gpmatching");
		dataSource.setMaxTotal(10);
		dataSource.setMaxIdle(5);
		dataSource.setMaxWaitMillis(-1);
		
		return dataSource;
	}
	@Bean
	public AccountServiceImpl accountService() {
		AccountServiceImpl accountService = new AccountServiceImpl();
		accountService.setUsermapper(applicationContext.getBean(UserMapper.class));
		return accountService;
	}
	
	@Bean
	public SqlSessionFactory sqlSessionFactory() throws Exception {
		SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean(); // 다른 객체를 만드는 객체
		factoryBean.setDataSource(dbcpDataSource());
		factoryBean.setConfigLocation(new ClassPathResource("mybatis-config.xml"));
		SqlSessionFactory sessionFactory = factoryBean.getObject(); // IoC 컨테이너에 등록할 객체 생성
		return sessionFactory;
	}

	
	
}
	
	

