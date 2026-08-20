package com.mironedel.picker.controller;

import com.mironedel.picker.engine.PickPredictor;
import com.mironedel.picker.model.CompletionResult;
import com.mironedel.picker.model.Metrics;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/predict")
@CrossOrigin(origins = "*")
public class PredictionController {
	private final PickPredictor predictor;
	
	public PredictionController(PickPredictor predictor) {
		this.predictor = predictor;
	}
	
	@PostMapping
	public CompletionResult predictFinish(@RequestBody Metrics metrics) {
		return predictor.predictFinishTime(metrics);
	}
}
