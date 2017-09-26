package com.geektext.exceptions;

public class XMLException extends ZoowaaException {

	private static final long serialVersionUID = 1252187982791860240L;

	public XMLException(String message) {
		super(message, null);
	}
	
	public XMLException(String message, Exception source) {
		super(message, source);
	}

}