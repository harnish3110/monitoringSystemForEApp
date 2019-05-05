package com.master.project.task.beans;

/**
 * @author Harnish
 *
 */
public class Location {

	private int id;
	private int userId;
	private double longitude;
	private double altitude;
	private double latitude;
	private double bearing;
	private double bearingAccuracy;
	private double verticalAccuracy;
	private double speedAccuracy;
	private String provider;
	private double speed;
	private double sppedAccuracyMPS;
	private double verticalAccuracyMtr;
	private long time;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

	public double getAltitude() {
		return altitude;
	}

	public void setAltitude(double altitude) {
		this.altitude = altitude;
	}

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public double getBearing() {
		return bearing;
	}

	public void setBearing(double bearing) {
		this.bearing = bearing;
	}

	public double getBearingAccuracy() {
		return bearingAccuracy;
	}

	public void setBearingAccuracy(double bearingAccuracy) {
		this.bearingAccuracy = bearingAccuracy;
	}

	public double getVerticalAccuracy() {
		return verticalAccuracy;
	}

	public void setVerticalAccuracy(double verticalAccuracy) {
		this.verticalAccuracy = verticalAccuracy;
	}

	public double getSpeedAccuracy() {
		return speedAccuracy;
	}

	public void setSpeedAccuracy(double speedAccuracy) {
		this.speedAccuracy = speedAccuracy;
	}

	public String getProvider() {
		return provider;
	}

	public void setProvider(String provider) {
		this.provider = provider;
	}

	public double getSpeed() {
		return speed;
	}

	public void setSpeed(double speed) {
		this.speed = speed;
	}

	public double getSppedAccuracyMPS() {
		return sppedAccuracyMPS;
	}

	public void setSppedAccuracyMPS(double sppedAccuracyMPS) {
		this.sppedAccuracyMPS = sppedAccuracyMPS;
	}

	public double getVerticalAccuracyMtr() {
		return verticalAccuracyMtr;
	}

	public void setVerticalAccuracyMtr(double verticalAccuracyMtr) {
		this.verticalAccuracyMtr = verticalAccuracyMtr;
	}

	public long getTime() {
		return time;
	}

	public void setTime(long time) {
		this.time = time;
	}

}
