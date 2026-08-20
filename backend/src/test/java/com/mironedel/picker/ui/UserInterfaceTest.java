package com.mironedel.picker.ui;

import static org.junit.jupiter.api.Assertions.*;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.PrintStream;
import java.util.Locale;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;

import com.mironedel.picker.service.LanguageService;

class UserInterfaceTest {
	
	private final InputStream originalIn = System.in;
	private final PrintStream originalOut = System.out;
	private ByteArrayOutputStream testOut;

	@BeforeEach
	void setUp() {
		testOut = new ByteArrayOutputStream();
		System.setOut(new PrintStream(testOut));
	}
	
	@AfterEach
	void restoreStreams() {
		System.setIn(originalIn);
		System.setOut(originalOut);
	}
	
	private void provideInput(String data) {
		ByteArrayInputStream testIn = new ByteArrayInputStream(data.getBytes());
		System.setIn(testIn);
	}
	
	@Test
	void testStart_SuccessfulFlow() {
		
		String simulatedInput = "08:00 a.m.\n1000\n10\n100\n";
		provideInput(simulatedInput);
		
		LanguageService i18n = new LanguageService(Locale.ENGLISH);
		UserInterface ui = new UserInterface(i18n);
		
		assertDoesNotThrow(ui::start);
		
		String output = testOut.toString();
		assertTrue(output.contains("09:00"), "Expected finish time 09:00 in output))");
		assertTrue(output.contains("1,000") || output.contains("1000"), "Expected items count in output");
	}
	
	@Test
	void testStart_InvalidTimeThenValidTime() {
		
		String simulatedInput = "invalid_time\n09:30\n500\n5\n100\n";
		provideInput(simulatedInput);
		
		LanguageService i18n = new LanguageService(Locale.ENGLISH);
		UserInterface ui = new UserInterface(i18n);
		
		ui.start();
		
		String output = testOut.toString();
		assertTrue(output.contains(i18n.getString("error.invalid_time")));
		assertTrue(output.contains("10:30"));
	}
	
	@ParameterizedTest
	@CsvSource({
		"'0\n1000\n10\n100\n'", //Zero items
		"'1000\n0\n10\n100\n'", //Zero pickers
		"'1000\n10\n0\n100\n'" //Zero pick rate
	})
	void testStart_HandlesZeroCapacityScenario(String metricsSequence) {
		String simulatedInput = "08:00\n" + metricsSequence;
		provideInput(simulatedInput);
		
		LanguageService i18n = new LanguageService(Locale.ENGLISH);
		UserInterface ui = new UserInterface(i18n);
		
		ui.start();
		
		String output = testOut.toString();
		assertTrue(output.contains(i18n.getString("error.positive_number")), "Expected error.positive_number warning when inputting zero");
	}
	
	@ParameterizedTest
	@CsvSource({
		"'-1000\n1000\n10\n100\n'", //-ive items
		"'1000\n-10\n10\n100\n'", //-ive pickers
		"'1000\n10\n-100\n100\n'" //-ive pick rate
	})
	void testStart_HandlesNegativeInputs(String metricsSequence) {
		String simulatedInput = "07:30\n" + metricsSequence;
		provideInput(simulatedInput);
		
		LanguageService i18n = new LanguageService(Locale.ENGLISH);
		UserInterface ui = new UserInterface(i18n);
		
		ui.start();
		
		String output = testOut.toString();
		assertTrue(output.contains(i18n.getString("error.positive_number")), "Expected error.positive_number warning when inputting zero");
	}
	
	@ParameterizedTest
	@CsvSource({
		"'abcd\n1000\n10\n100\n'", //invalid items
		"'1000\n5.41\n10\n100\n'", //invalid pickers
		"'1000\n10\ni98\n100\n'" //invalid pick rate
	})
	void testStart_HandlesInvalidInputs(String metricsSequence) {
		String simulatedInput = "11:00\n" + metricsSequence;
		provideInput(simulatedInput);
		
		LanguageService i18n = new LanguageService(Locale.ENGLISH);
		UserInterface ui = new UserInterface(i18n);
		
		ui.start();
		
		String output = testOut.toString();
		assertTrue(output.contains(i18n.getString("error.integer_required")), "Expected error.positive_number warning when inputting zero");
	}
	
	@ParameterizedTest
	@CsvSource({
		"'10000\n10\n100\n'", //10000
		"'10 000\n10\n100\n'", //10 000
		"'10,000\n10\n100\n'", //10,000
		"'10_000\n10\n100\n'" //10_000
	})
	void testStart_ItemNumberSeperator(String metricsSequence) {
		String simulatedInput = "09:30\n" + metricsSequence;
		provideInput(simulatedInput);
		
		LanguageService i18n = new LanguageService(Locale.ENGLISH);
		UserInterface ui = new UserInterface(i18n);
		
		ui.start();
		
		String output = testOut.toString();
		assertTrue(output.contains("10,000"), "System should accept 10000 of any seperator ('', ' ', ',', '_', ");
	}
	
	@ParameterizedTest
	@CsvSource({
		"'10.000\n10000\n10\n100\n'",
	})
	void testStart_DotInputIsRejected(String metricsSequence) {
		String simulatedInput = "09:30\n" + metricsSequence;
		provideInput(simulatedInput);
		
		LanguageService i18n = new LanguageService(Locale.ENGLISH);
		UserInterface ui = new UserInterface(i18n);
		
		ui.start();
		
		String output = testOut.toString();
		assertTrue(output.contains("10,000"), "System should reject 10.000");
	}
	
	
	
}
