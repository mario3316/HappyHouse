package com.ssafy.happyhouse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.ssafy.happyhouse.interceptor.ConfirmInterceptor;

@Configuration
public class WebConfiguration implements WebMvcConfigurer {

	@Autowired
	private ConfirmInterceptor confirmInterceptor;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(confirmInterceptor).addPathPatterns("/house/**");
//		registry.addInterceptor(confirmInterceptor).addPathPatterns("/admin/**");
////		registry.addInterceptor(confirmInterceptor).addPathPatterns("/user/logout");
////		registry.addInterceptor(confirmInterceptor).addPathPatterns("/house/list");
	}

}
