package com.mironedel.picker.engine;

import com.mironedel.picker.model.CompletionResult;
import com.mironedel.picker.model.Metrics;

public interface PickPredictor {
		CompletionResult predictFinishTime(Metrics metrics);
	}