package main;

import java.util.Locale;

public class Main {
	
	public static void main (String[] args) {
		
		Locale locale = Locale.ENGLISH;
		LanguageService languageService = new LanguageService(locale);
		UserInterface ui = new UserInterface(languageService);
		ui.start();
		
	}
}
