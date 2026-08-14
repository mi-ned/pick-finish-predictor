package tests;

import static org.junit.Assert.assertThrows;
import static org.junit.jupiter.api.Assertions.*;

import java.time.LocalTime;
import java.time.format.DateTimeParseException;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;

import main.TimeParser;


class TimeParserTest {
	
	@ParameterizedTest
	@ValueSource(strings = {
			"00:00",
			"00.00",
			"00 00",
			"0000",
			"000",
			"12am",
			"12 am",
			"12AM",
			"12 AM",
			"12 a.m.",
			"12 A.M.",
			"12:00am",
			"12:00 am",
			"12:00AM",
			"12:00 AM",
			"12:00 a.m.",
			"12:00 A.M.",
			"12.00am",
			"12.00 am",
			"12.00AM",
			"12.00 AM",
			"12.00 a.m.",
			"12.00 A.M.",
			"12 00am",
			"12 00 am",
			"12 00AM",
			"12 00 AM",
			"12 00 a.m.",
			"12 00 A.M.",
			"1200am",
			"1200 am",
			"1200AM",
			"1200 AM",
			"1200 a.m.",
			"1200 A.M."
	})
	void testMidnight(String input) {
		assertEquals(LocalTime.of(0,00), TimeParser.parseTime(input));
	}
	
	@ParameterizedTest
	@ValueSource(strings = {
			"12:00",
			"12.00",
			"12 00",
			"1200",
			"12pm",
			"12 pm",
			"12PM",
			"12 PM",
			"12 p.m.",
			"12 P.M.",
			"12:00pm",
			"12:00 pm",
			"12:00PM",
			"12:00 PM",
			"12:00 p.m.",
			"12:00 P.M.",
			"12.00pm",
			"12.00 pm",
			"12.00PM",
			"12.00 PM",
			"12.00 p.m.",
			"12.00 P.M.",
			"12 00pm",
			"12 00 pm",
			"12 00PM",
			"12 00 PM",
			"12 00 p.m.",
			"12 00 P.M.",
			"1200pm",
			"1200 pm",
			"1200PM",
			"1200 PM",
			"1200 p.m.",
			"1200 P.M."
	})
	void testNoon(String input) {
		assertEquals(LocalTime.of(12,00), TimeParser.parseTime(input));
	}
	
	@ParameterizedTest
	@ValueSource(strings = {
			"13:05",
			"13.05",
			"13 05",
			"1305",
			"105pm",
			"105 pm",
			"105PM",
			"105 PM",
			"105 p.m.",
			"105 P.M.",
			"1:05pm",
			"1:05 pm",
			"1:05PM",
			"1:05 PM",
			"1:05 p.m.",
			"1:05 P.M.",
			"1.05pm",
			"1.05 pm",
			"1.05PM",
			"1.05 PM",
			"1.05 p.m.",
			"1.05 P.M.",
			"1 05pm",
			"1 05 pm",
			"1 05PM",
			"1 05 PM",
			"1 05 p.m.",
			"1 05 P.M.",
			"0105pm",
			"0105 pm",
			"0105PM",
			"0105 PM",
			"0105 p.m.",
			"0105 P.M.",
			"01:05pm",
			"01:05 pm",
			"01:05PM",
			"01:05 PM",
			"01:05 p.m.",
			"01:05 P.M.",
			"01.05pm",
			"01.05 pm",
			"01.05PM",
			"01.05 PM",
			"01.05 p.m.",
			"01.05 P.M.",
			"01 05pm",
			"01 05 pm",
			"01 05PM",
			"01 05 PM",
			"01 05 p.m.",
			"01 05 P.M.",
	})
	void testOneZeroFivePM(String input) {
		assertEquals(LocalTime.of(13, 05), TimeParser.parseTime(input));
	}
	
	@ParameterizedTest
	@ValueSource(strings = {
			"9:30",
			"9.30",
			"9 30",
			"930",
			"09:30",
			"09.30",
			"09 30",
			"0930",
			"930am",
			"930 am",
			"930AM",
			"930 AM",
			"930 a.m.",
			"930 A.M.",
			"9:30am",
			"9:30 am",
			"9:30AM",
			"9:30 AM",
			"9:30 a.m.",
			"9:30 A.M.",
			"9.30am",
			"9.30 am",
			"9.30AM",
			"9.30 AM",
			"9.30 a.m.",
			"9.30 A.M.",
			"9 30am",
			"9 30 am",
			"9 30AM",
			"9 30 AM",
			"9 30 a.m.",
			"9 30 A.M.",
			"0930am",
			"0930 am",
			"0930AM",
			"0930 AM",
			"0930 a.m.",
			"0930 A.M.",
			"09:30am",
			"09:30 am",
			"09:30AM",
			"09:30 AM",
			"09:30 a.m.",
			"09:30 A.M.",
			"09.30am",
			"09.30 am",
			"09.30AM",
			"09.30 AM",
			"09.30 a.m.",
			"09.30 A.M.",
			"09 30am",
			"09 30 am",
			"09 30AM",
			"09 30 AM",
			"09 30 a.m.",
			"09 30 A.M.",
	})
	void testNineThirtyAM(String input) {
		assertEquals(LocalTime.of(9, 30), TimeParser.parseTime(input));
	}
	
	@ParameterizedTest
	@ValueSource(strings = {
	        "14:00", "14.00", "14 00", "1400"
	})
	void testTwentyFourHourFormatAfternoonEvening(String input) {
	    assertEquals(LocalTime.of(14, 0), TimeParser.parseTime(input));
	}
	
	@ParameterizedTest
	@ValueSource(strings = {
	        "0600", "06.00", "06 00", "06:00"
	})
	void testThreeDigitsFormatMorning(String input) {
	    assertEquals(LocalTime.of(6, 00), TimeParser.parseTime(input));
	}
	
	@ParameterizedTest
	@ValueSource(strings = {
	        "930", "9.30", "9 30", "9:30"
	})
	void testThreeDigitsFormat(String input) {
	    assertEquals(LocalTime.of(9, 30), TimeParser.parseTime(input));
	}
	
	@ParameterizedTest
	@ValueSource(strings = {
			"00:01",
			"00.01",
			"00 01",
			"0001",
			"12:01am",
			"12:01 am",
			"12:01AM",
			"12:01 AM",
			"12:01 a.m.",
			"12:01 A.M.",
			"12.01am",
			"12.01 am",
			"12.01AM",
			"12.01 AM",
			"12.01 a.m.",
			"12.01 A.M.",
			"12 01am",
			"12 01 am",
			"12 01AM",
			"12 01 AM",
			"12 01 a.m.",
			"12 01 A.M.",
			"1201am",
			"1201 am",
			"1201AM",
			"1201 AM",
			"1201 a.m.",
			"1201 A.M."
	})
	void testStartOfDay(String input) {
	    assertEquals(LocalTime.of(0, 01), TimeParser.parseTime(input));
	}
	
	@ParameterizedTest
	@ValueSource(strings = {
			"23:59",
			"23.59",
			"23 59",
			"2359",
			"11:59pm",
			"11:59 pm",
			"11:59PM",
			"11:59 PM",
			"11:59 p.m.",
			"11:59 P.M.",
			"11.59pm",
			"11.59 pm",
			"11.59PM",
			"11.59 PM",
			"11.59 p.m.",
			"11.59 P.M.",
			"11 59pm",
			"11 59 pm",
			"11 59PM",
			"11 59 PM",
			"11 59 p.m.",
			"11 59 P.M.",
			"1159pm",
			"1159 pm",
			"1159PM",
			"1159 PM",
			"1159 p.m.",
			"1159 P.M."
	})
	void testEndOfDay(String input) {
	    assertEquals(LocalTime.of(23, 59), TimeParser.parseTime(input));
	}
	
	@ParameterizedTest
	@ValueSource(strings = {
			"",
			" ",
			"45:67",
			"abc",
			"12:34:56",
			"12:34:56:00",
			"12345",
			"12:60pm",
			"12.3.4",
			"12 34 56"
	})
	void testInvalidInputs(String input) {
	    assertThrows(DateTimeParseException.class, () -> TimeParser.parseTime(input));
	}
	
	@ParameterizedTest
	@ValueSource(strings = {
			"13:00am",
			"13:00pm",
			"12:00:am",
			"12::00",
			"12..00",
			"12:pm",
			":30am",
			":30pm",
						
	})
	void testInvalidSyntax(String input) {
	    assertThrows(DateTimeParseException.class, () -> TimeParser.parseTime(input));
	}
	
	
	@Test
	void testNullInputThrowsException() {
	    assertThrows(DateTimeParseException.class, () -> TimeParser.parseTime(null));
	}
	
	@ParameterizedTest
	@ValueSource(strings = {
	        "  12:00 pm  ", "\t12:00   pm\n", "  12pm "
	})
	void testWhitespaceTrimming(String input) {
	    assertEquals(LocalTime.of(12, 0), TimeParser.parseTime(input));
	}
	
	@ParameterizedTest
	@ValueSource(strings = {
	        "24:00", "24 00", "2400", "24.00",
	})
	void test24(String input) {
	    assertEquals(LocalTime.of(0, 0), TimeParser.parseTime(input));
	}
	

}
