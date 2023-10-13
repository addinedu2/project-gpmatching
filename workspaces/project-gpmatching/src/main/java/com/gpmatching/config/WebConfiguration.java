package com.gpmatching.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.gpmatching.interceptor.AlarmInterceptor;
import com.gpmatching.interceptor.AuthInterceptor;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = { "com.gpmatching.controller" , "com.gpmatching.matchingboard" })
public class WebConfiguration implements WebMvcConfigurer {
	
	
	
	@Bean
	public InternalResourceViewResolver internalResourceViewResolver() {
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setPrefix("/WEB-INF/views/");
		viewResolver.setSuffix(".jsp");
		return viewResolver;
	}
	
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
		multipartResolver.setDefaultEncoding("utf-8");
		multipartResolver.setMaxInMemorySize(2*1024*1024);
		multipartResolver.setMaxUploadSize(10*1024*1024);
		
		return multipartResolver;
	}
	
	
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	}
	
	//로그인 검증 인터셉터 bean 등록
	@Bean
	public AuthInterceptor authInterceptor() {
		return new AuthInterceptor();
	}
	
	//알림 인터셉터 bean 등록
	@Bean
	public AlarmInterceptor alarmInterceptor() {
		return new AlarmInterceptor();
	}
	
	//인터셉터 bean 추가
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(authInterceptor())
				.addPathPatterns("/boardMatching/**") // 로그인 검증 인터셉터를 매칭게시판에 적용
				.addPathPatterns("/commonBoard/**") // 공통 게시판
				.excludePathPatterns("/boardMatching/lolBoard/lol-list", "/boardMatching/pubgBoard/battleground-list", 
						"/boardMatching/overwatchBoard/overwatch-list", "/boardMatching/lolBoard/ajax-show-comment", 
						"/commonBoard/commonList"); // 게시물 보기는 로그인 없이 가능 
		registry.addInterceptor(alarmInterceptor());	// 알림 인터셉터 추가
	}
	
	

}
