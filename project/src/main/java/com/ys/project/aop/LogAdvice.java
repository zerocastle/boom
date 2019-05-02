package com.ys.project.aop;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class LogAdvice {

	private static final Logger log = LoggerFactory.getLogger(LogAdvice.class);

	@Around("execution(* com.ys.project.controller..*Controller.*(..))")
	public Object logPrint(ProceedingJoinPoint joinPoint) throws Throwable {

		Object result = joinPoint.proceed();
		log.info("=======================시작===========================");

		String type = joinPoint.getSignature().getDeclaringTypeName();

		// 메서드 이름
		log.info("컨트롤러 + 메서드" + type + "." + joinPoint.getSignature().getName() + "()");

		// 매개 변수
		log.info("매개변수 : " + Arrays.deepToString(joinPoint.getArgs()));

		return result;
	}

}
