package main;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeFormatterBuilder;
import java.time.format.DateTimeParseException;
import java.util.Locale;

public class TimeParser {
	
	private static final DateTimeFormatter[] FORMATTERS = new DateTimeFormatter[] {
			createFormatter("h:m a"),
			createFormatter("h.m a"),
			createFormatter("h m a"),
			
			createFormatter("H:m"),
			createFormatter("H.m"),
			createFormatter("H m"),
			
			createFormatter("h a"),
			
			createFormatter("hhmm a"),
			createFormatter("hmm a"),
			createFormatter("HHmm"),
			createFormatter("Hmm"),
			
	};
	
	public static LocalTime parseTime(String rawInput) throws DateTimeParseException {
		if(rawInput == null || rawInput.trim().isEmpty()) {
			throw new DateTimeParseException("Input string is empty", "", 0);
		}
		
		String cleanInput = rawInput.trim()
				.replaceAll("(?i)(?<=[ap])\\.(?=m)", "")
                .replaceAll("(?i)(?<=[ap]m)\\.", "");
		
		cleanInput = cleanInput.replaceAll("(?i)(?<=\\d)\\s*(?=[ap]m\\b)", " ");
		
		cleanInput = cleanInput.replaceAll("\\s+", " ");
		
		for(DateTimeFormatter formatter : FORMATTERS) {
			try {
				return LocalTime.parse(cleanInput, formatter);
			} catch(DateTimeParseException ignored) {
				
			}
		}
		
		throw new DateTimeParseException("Could not parse time: " + rawInput, rawInput, 0);
		
	}
	
	private static DateTimeFormatter createFormatter(String pattern) {
		return new DateTimeFormatterBuilder()
				.parseCaseInsensitive()
				.appendPattern(pattern)
				.toFormatter(Locale.ENGLISH);
	}
}