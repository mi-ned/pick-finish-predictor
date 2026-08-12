package tests;

import static org.junit.jupiter.api.Assertions.*;

import java.time.LocalTime;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;

import main.TimeParser;


class TimeParserTest {

	@Test
	void testSample() {
		assertEquals(LocalTime.of(5, 59), TimeParser.parseTime("05:59"));
	}
	
	@ParameterizedTest
	@ValueSource(strings = {"1pm", "etc..."})
	void testSample2(String input) {
		assertEquals(LocalTime.of(5, 59), TimeParser.parseTime(input));
	}

}
