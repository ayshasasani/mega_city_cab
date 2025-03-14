package model;

import java.sql.Timestamp;

public class Booking {
    private int bookingId;
    private int userId; 
    private String pickupLocation;
    private double pickupLat;
    private double pickupLng;
    private String dropoffLocation;
    private double dropoffLat;
    private double dropoffLng;
    private String cabType;
    private String rideType;
    private Timestamp scheduledTime;
    private double fare;
    private String status;
    private Timestamp bookingTime;

    // Constructor for creating a new booking (without bookingId)
    public Booking(int userId, String pickupLocation, double pickupLat, double pickupLng,
                   String dropoffLocation, double dropoffLat, double dropoffLng, 
                   String cabType, String rideType, Timestamp scheduledTime, 
                   double fare, String status, Timestamp bookingTime) {
        this.userId = userId;
        this.pickupLocation = pickupLocation;
        this.pickupLat = pickupLat;
        this.pickupLng = pickupLng;
        this.dropoffLocation = dropoffLocation;
        this.dropoffLat = dropoffLat;
        this.dropoffLng = dropoffLng;
        this.cabType = cabType;
        this.rideType = rideType;
        this.scheduledTime = scheduledTime;
        this.fare = fare;
        this.status = status;
        this.bookingTime = bookingTime;
    }

    // Constructor for retrieving a booking (includes bookingId)
    public Booking(int bookingId, int userId, String pickupLocation, double pickupLat, double pickupLng,
                   String dropoffLocation, double dropoffLat, double dropoffLng, 
                   String cabType, String rideType, Timestamp scheduledTime, 
                   double fare, String status, Timestamp bookingTime) {
        this.bookingId = bookingId;
        this.userId = userId;
        this.pickupLocation = pickupLocation;
        this.pickupLat = pickupLat;
        this.pickupLng = pickupLng;
        this.dropoffLocation = dropoffLocation;
        this.dropoffLat = dropoffLat;
        this.dropoffLng = dropoffLng;
        this.cabType = cabType;
        this.rideType = rideType;
        this.scheduledTime = scheduledTime;
        this.fare = fare;
        this.status = status;
        this.bookingTime = bookingTime;
    }

    // Getters and Setters
    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getPickupLocation() {
        return pickupLocation;
    }

    public void setPickupLocation(String pickupLocation) {
        this.pickupLocation = pickupLocation;
    }

    public double getPickupLat() {
        return pickupLat;
    }

    public void setPickupLat(double pickupLat) {
        this.pickupLat = pickupLat;
    }

    public double getPickupLng() {
        return pickupLng;
    }

    public void setPickupLng(double pickupLng) {
        this.pickupLng = pickupLng;
    }

    public String getDropoffLocation() {
        return dropoffLocation;
    }

    public void setDropoffLocation(String dropoffLocation) {
        this.dropoffLocation = dropoffLocation;
    }

    public double getDropoffLat() {
        return dropoffLat;
    }

    public void setDropoffLat(double dropoffLat) {
        this.dropoffLat = dropoffLat;
    }

    public double getDropoffLng() {
        return dropoffLng;
    }

    public void setDropoffLng(double dropoffLng) {
        this.dropoffLng = dropoffLng;
    }

    public String getCabType() {
        return cabType;
    }

    public void setCabType(String cabType) {
        this.cabType = cabType;
    }

    public String getRideType() {
        return rideType;
    }

    public void setRideType(String rideType) {
        this.rideType = rideType;
    }

    public Timestamp getScheduledTime() {
        return scheduledTime;
    }

    public void setScheduledTime(Timestamp scheduledTime) {
        this.scheduledTime = scheduledTime;
    }

    public double getFare() {
        return fare;
    }

    public void setFare(double fare) {
        this.fare = fare;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Timestamp getBookingTime() {
        return bookingTime;
    }

    public void setBookingTime(Timestamp bookingTime) {
        this.bookingTime = bookingTime;
    }
}
