package com.mironedel.picker.service;

import java.text.MessageFormat;
import java.util.Locale;
import java.util.ResourceBundle;

public class LanguageService {
	
	private ResourceBundle bundle;
	
	public LanguageService(Locale locale) {
		setLocale(locale);
	}
	
	public Locale getLocale() {
		return this.bundle.getLocale();
	}
	
	public void setLocale(Locale locale) {
		this.bundle = ResourceBundle.getBundle("messages", locale);
	}
	
	public String getString(String key) {
		return bundle.getString(key);
	}
	
	public String getString(String key, Object... args) {
		String pattern = bundle.getString(key);
		return MessageFormat.format(pattern, args);
	}

}
