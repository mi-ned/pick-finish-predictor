package com.mironedel.picker.exception;

public class InvalidCapacityException extends RuntimeException {
	private static final long serialVersionUID = 1L;
	public InvalidCapacityException(String messageKey) {
		super(messageKey);
	}
}