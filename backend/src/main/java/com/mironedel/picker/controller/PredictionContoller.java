package com.mironedel.picker.controller;

import com.mironedel.picker.engine.PickPredictor;
import com.mironedel.picker.engine.SimpleCalculator;
import com.mironedel.picker.model.CompletionResult;
import com.mironedel.picker.model.Metrics;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/predict")
public class PredictionContoller {
	private final PickPredictor predictor = new SimpleCalculator();
	
	@PostMapping
	public CompletionResult predictFinish(@RequestBody Metrics metrics) {
		return predictor.predictFinishTime(metrics);
	}
}
