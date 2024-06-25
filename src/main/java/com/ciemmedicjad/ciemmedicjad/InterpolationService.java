package com.ciemmedicjad.ciemmedicjad;
//package com.example.interpolation.service;
//package com.example.interpolation.service;

//import com.example.interpolation.model.DataPoint;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class InterpolationService {

    private List<Datapoint> dataPoints = new ArrayList<>();

    public void addDataPoint(double x, double fx) {
        dataPoints.add(new Datapoint(x, fx));
    }

    public void clearDataPoints() {
        dataPoints.clear();
    }

    public List<Datapoint> getDataPoints() {
        return dataPoints;
    }

    public String interpolate(int degree) {
        // Implementación de la interpolación de Newton
        int n = dataPoints.size();
        double[] x = new double[n];
        double[] y = new double[n];

        for (int i = 0; i < n; i++) {
            x[i] = dataPoints.get(i).getX();
            y[i] = dataPoints.get(i).getFx();
        }

        double[] coef = new double[n];
        for (int i = 0; i < n; i++) {
            coef[i] = y[i];
        }

        for (int j = 1; j < n; j++) {
            for (int i = n - 1; i >= j; i--) {
                coef[i] = (coef[i] - coef[i - 1]) / (x[i] - x[i - j]);
            }
        }

        StringBuilder polynomial = new StringBuilder();
        for (int i = 0; i < n; i++) {
            if (i > 0 && coef[i] >= 0) {
                polynomial.append(" + ");
            } else if (coef[i] < 0) {
                polynomial.append(" - ");
            }
            polynomial.append(Math.abs(coef[i]));
            for (int j = 0; j < i; j++) {
                polynomial.append("(x - ").append(x[j]).append(")");
            }
        }

        return polynomial.toString();
    }
}
