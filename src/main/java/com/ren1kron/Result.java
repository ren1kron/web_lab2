package com.ren1kron;


/**
 *
 */
public class Result {
    private float x;
    private float y;
    private float r;

    private boolean hit;
    private String reqNanoTime;

    public Result(float x, float y, float r, boolean hit, String reqNanoTime) {
        this.x = x;
        this.y = y;
        this.r = r;
        this.hit = hit;
        this.reqNanoTime = reqNanoTime;
    }

    public float getX() {
        return x;
    }

    public float getY() {
        return y;
    }

    public float getR() {
        return r;
    }

    public boolean isHit() {
        return hit;
    }

    public String getReqNanoTime() {
        return reqNanoTime;
    }
}
