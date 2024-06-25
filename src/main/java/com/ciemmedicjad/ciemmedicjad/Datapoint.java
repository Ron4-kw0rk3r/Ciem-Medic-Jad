package com.ciemmedicjad.ciemmedicjad;



public class Datapoint {
    private double x;
    private double fx;

    public Datapoint() {}

    public Datapoint(double x, double fx) {
        this.x = x;
        this.fx = fx;
    }
    // Getters and setters
    public double getX() {
        return x;
    }

    public void setX(double x) {
        this.x = x;
    }

    public double getFx() {
        return fx;
    }

    public void setFx(double fx) {
        this.fx = fx;
    }
}
 
