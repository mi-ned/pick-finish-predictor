package com.mironedel.picker.ui;

import java.util.Locale;

import com.mironedel.picker.service.LanguageService;

public class Main {
	
	public static void main (String[] args) {
		
		Locale locale = Locale.ENGLISH;
		LanguageService languageService = new LanguageService(locale);
		UserInterface ui = new UserInterface(languageService);
		ui.start();
		
	}
	
}
