package com.mironedel.picker.controller;

import com.mironedel.picker.engine.SimpleCalculator;
import com.mironedel.picker.engine.TimeParser;
import com.mironedel.picker.model.CompletionResult;
import com.mironedel.picker.model.PredictionRequest;

import java.time.LocalTime;

import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/predict")
@CrossOrigin(origins = "*")
public class PredictionController {
	
	private final SimpleCalculator calculator;
	
	public PredictionController(SimpleCalculator calculator) {
		this.calculator = calculator;
	}
	
	@PostMapping
	public CompletionResult predictFinish(@RequestBody PredictionRequest request) {
		LocalTime inputTime = (request.getInputTime() != null && !request.getInputTime().isBlank()) ? TimeParser.parseTime(request.getInputTime()) : LocalTime.now();
		return calculator.calculateCompletionTime(inputTime, request.getMetrics());
	}
}
