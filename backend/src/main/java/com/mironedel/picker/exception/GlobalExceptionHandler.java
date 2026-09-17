package com.mironedel.picker.exception;

import java.util.Locale;
import java.util.Map;

import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
public class GlobalExceptionHandler {
	private final MessageSource messageSource;

	public GlobalExceptionHandler(MessageSource messageSource) {
		this.messageSource = messageSource;
	}

	@ExceptionHandler(InvalidCapacityException.class)
	public ResponseEntity<Map<String, String>> handleInvalidCapacity(InvalidCapacityException ex, Locale locale) {
		String localisedErrorMessage = messageSource.getMessage(ex.getMessage(), null, locale);

		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(Map.of("error", localisedErrorMessage));
	}
}