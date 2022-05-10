package com.nongsa.handler.aop;

import com.nongsa.handler.exception.CustomValidationException;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.context.support.DefaultMessageSourceResolvable;
import org.springframework.stereotype.Component;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;

@Component
@Aspect
public class ValidationAdvice {

	@Around("execution(* com.nongsa.controller.api.*Controller.*(..))")
	public Object apiAdvice(ProceedingJoinPoint proceedingJoinPoint) throws Throwable {
		Object[] args = proceedingJoinPoint.getArgs();
		Arrays.stream(args)
				.filter(arg -> arg instanceof BindingResult)
				.map(arg -> (BindingResult) arg).filter(Errors::hasErrors)
				.forEach(ValidationAdvice::accept);
		return proceedingJoinPoint.proceed();
	}

	private static void accept(BindingResult bindingResult) {
		Map<String, String> errorMap = bindingResult.getFieldErrors()
				.stream().collect(Collectors.toMap(FieldError::getField, DefaultMessageSourceResolvable::getDefaultMessage, (a, b) -> b));
		throw new CustomValidationException("유효성검사 실패", errorMap);
	}

}
