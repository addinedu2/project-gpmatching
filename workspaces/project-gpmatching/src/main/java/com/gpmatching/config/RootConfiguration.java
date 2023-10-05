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
import com.gpmatching.matchingboard.lolboard.service.LolBoardService;
import com.gpmatching.matchingboard.lolboard.service.LolBoardServiceImpl;
import com.gpmatching.matchingboard.lolboard.service.LolService;
import com.gpmatching.matchingboard.lolboard.service.LolServiceImpl;
import com.gpmatching.matchingboard.overwatchboard.service.OverwatchBoardService;
import com.gpmatching.matchingboard.overwatchboard.service.OverwatchBoardServiceImpl;
import com.gpmatching.matchingboard.overwatchboard.service.OverwatchService;
import com.gpmatching.matchingboard.overwatchboard.service.OverwatchServiceImpl;
import com.gpmatching.matchingboard.pubgboard.service.PubgBoardService;
import com.gpmatching.matchingboard.pubgboard.service.PubgBoardServiceImpl;
import com.gpmatching.matchingboard.pubgboard.service.PubgService;
import com.gpmatching.matchingboard.pubgboard.service.PubgServiceImpl;
import com.gpmatching.service.AccountServiceImpl;
import com.gpmatching.service.BoardCommentService;
import com.gpmatching.service.BoardCommentServiceImpl;
import com.gpmatching.service.CommonBoardService;
import com.gpmatching.service.CommonBoardServiceImpl;
import com.gpmatching.service.GameListService;
import com.gpmatching.service.GameListServiceImpl;
import com.gpmatching.service.MatchingAlarmService;
import com.gpmatching.service.MatchingAlarmServiceImpl;
import com.gpmatching.service.MatchingCommentService;
import com.gpmatching.service.MatchingCommentServiceImpl;
import com.gpmatching.service.MatchingReviewService;
import com.gpmatching.service.MatchingReviewServiceImpl;
import com.gpmatching.service.ReportBoardService;
import com.gpmatching.service.ReportBoardServiceImpl;



@Configuration
@MapperScan(basePackages = { "com.gpmatching.mapper" , "com.gpmatching.matchingboard"}) //xml  설정의 <mybatis:scan 을 대신하는 annotation
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
		//dataSource.setUrl("jdbc:mysql://127.0.0.1:3306/gpmatchingdb" );
		dataSource.setUrl("jdbc:mysql://3.39.195.155/gpmatchingdb" );
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
		accountService.setUserMapper(applicationContext.getBean(UserMapper.class));
		return accountService;
	}
	
	@Bean
	public CommonBoardService commonBoardService() {
		CommonBoardService commonBoardService = new CommonBoardServiceImpl();
		return commonBoardService;
	}
	
	@Bean
	public ReportBoardService reportBoardService() {
		ReportBoardService reportBoardService = new ReportBoardServiceImpl();
		return reportBoardService;
	}
	
	@Bean
	public BoardCommentService boardCommentService() {
		BoardCommentService commentService = new BoardCommentServiceImpl();
		return commentService;
	}
	
	@Bean
	public GameListService gameListService() {
		GameListService gameListService = new GameListServiceImpl();
		return gameListService;
		
	}
	
	@Bean
	public LolService lolService() {
		LolService lolService = new LolServiceImpl();
		return lolService;
		
	}


	@Bean
	public PubgService pubgService() {
		PubgService pubgService = new PubgServiceImpl();
		return pubgService;
		
	}
	
	@Bean
	public OverwatchService overwatchService() {
		OverwatchService overwatchService = new OverwatchServiceImpl();
		return overwatchService;
		
	}
	
	@Bean
	public LolBoardService lolBoardService() {
		
		return new LolBoardServiceImpl();
	}
	
	@Bean
	public OverwatchBoardService overwatchBoardService() {
		
		return new OverwatchBoardServiceImpl();
	}
	
	@Bean
	public PubgBoardService pubgBoardService() {
		
		return new PubgBoardServiceImpl();
	}
	
	@Bean
	public MatchingAlarmService matchingAlarmService() {
		
		return new MatchingAlarmServiceImpl();
	}


}
	
	

