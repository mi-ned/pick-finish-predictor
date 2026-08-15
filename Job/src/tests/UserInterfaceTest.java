package tests;

import static org.junit.jupiter.api.Assertions.*;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.PrintStream;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import main.UserInterface;

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
	
	@Test
	void testStart_SuccessfulFlow() {
		
	}
}
