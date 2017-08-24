package com.macmis;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.handler.MappedInterceptor;

@SpringBootApplication
public class MacMisApplication {

	public static void main(String[] args) {
		SpringApplication.run(MacMisApplication.class, args);
	}

	@Bean
	public MappedInterceptor myInterceptor()
	{
	    return new MappedInterceptor(null, new MacMisInterceptor());
	}

	// @Bean
	// public MultipartResolver multipartResolver() {
	// return new CommonsMultipartResolver();
	// }

}
