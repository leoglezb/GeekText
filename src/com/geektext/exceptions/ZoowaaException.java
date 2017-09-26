package com.geektext.exceptions;

public class ZoowaaException extends java.lang.Exception {

	private static final long serialVersionUID = 8793242859756832264L;

	public ZoowaaException(String message, Exception source) {
		super(message+(source!=null?"\n"+source.getMessage():""));
		if (source!=null) source.printStackTrace();
	}
	
	/* chequear si la cadena de error contiene la subcadena pasada como parametro */
	public boolean containsStr(String subStr){
		return this.getMessage().toLowerCase().indexOf(subStr.toLowerCase())>-1;
	}

}