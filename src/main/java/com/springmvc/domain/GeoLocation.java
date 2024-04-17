package com.springmvc.domain;

public class GeoLocation {
    private double latitude; // 위도
    private double longitude; // 경도

    // 생성자
    public GeoLocation(double latitude, double longitude) {
        this.latitude = latitude;
        this.longitude = longitude;
    }

    // 위도를 반환하는 메서드
    public double getLatitude() {
        return latitude;
    }

    // 경도를 반환하는 메서드
    public double getLongitude() {
        return longitude;
    }

    // 위도를 설정하는 메서드
    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }

    // 경도를 설정하는 메서드
    public void setLongitude(double longitude) {
        this.longitude = longitude;
    }
}
