<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book a Ride | Mega City Cab</title>

    <!-- Leaflet.js for Maps -->
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.3/dist/leaflet.css" />
    <script src="https://unpkg.com/leaflet@1.9.3/dist/leaflet.js"></script>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            text-align: center;
        }
        h2 {
            margin-top: 20px;
        }
        #map {
            height: 400px;
            width: 100%;
            max-width: 700px;
            margin: auto;
            border-radius: 10px;
        }
        form {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            margin: 20px auto;
            text-align: left;
        }
        label {
            font-weight: bold;
            display: block;
            margin: 10px 0 5px;
        }
        input, select, button {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button {
            background-color: #28a745;
            color: white;
            font-size: 16px;
            cursor: pointer;
            border: none;
        }
        button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

    <h2>Book Your Ride</h2>

    <!-- Map Section -->
    <div id="map"></div>

    <!-- Booking Form -->
    <form action="booking" method="POST">
        <label>Pickup Location:</label>
        <input type="text" id="pickup" name="pickupLocation" required readonly>

        <label>Drop-off Location:</label>
        <input type="text" id="dropoff" name="dropoffLocation" required readonly>

        <label>Cab Type:</label>
        <select name="cabType" required>
            <option value="Standard">Standard</option>
            <option value="SUV">SUV</option>
            <option value="Luxury">Luxury</option>
        </select>

        <label>Ride Type:</label>
        <select id="rideType" name="rideType" required>
            <option value="Instant">Instant Ride</option>
            <option value="Scheduled">Scheduled Ride</option>
        </select>

        <div id="scheduledTimeContainer" style="display: none;">
            <label>Scheduled Date & Time:</label>
            <input type="datetime-local" id="scheduledTime" name="scheduledTime">
        </div>

        <label>Estimated Fare (LKR):</label>
        <input type="text" id="fare" name="fare" readonly>

        <!-- Hidden fields for coordinates -->
        <input type="hidden" id="pickupLat" name="pickupLat">
        <input type="hidden" id="pickupLng" name="pickupLng">
        <input type="hidden" id="dropoffLat" name="dropoffLat">
        <input type="hidden" id="dropoffLng" name="dropoffLng">

        <button type="submit">Confirm Booking</button>
    </form>

    <script>
        var map = L.map('map').setView([7.8731, 80.7718], 8);

        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: '&copy; OpenStreetMap contributors'
        }).addTo(map);

        var pickupMarker = null, dropoffMarker = null;

        map.on('click', function(e) {
            if (!pickupMarker) {
                pickupMarker = addMarker(e.latlng, "Pickup Location");
                updateLocationFields("pickup", pickupMarker, e.latlng);
            } else if (!dropoffMarker) {
                dropoffMarker = addMarker(e.latlng, "Drop-off Location");
                updateLocationFields("dropoff", dropoffMarker, e.latlng);
            } else {
                alert("Both pickup & drop-off locations are already selected.");
            }
        });

        function addMarker(latlng, label) {
            return L.marker(latlng, { draggable: true }).addTo(map)
                .bindPopup(label).openPopup();
        }

        function updateLocationFields(type, marker, latlng) {
            fetch(`https://nominatim.openstreetmap.org/reverse?format=json&lat=${latlng.lat}&lon=${latlng.lng}`)
                .then(response => response.json())
                .then(data => {
                    let locationName = data.display_name || "Unknown Location";

                    if (type === "pickup") {
                        document.getElementById("pickup").value = locationName;
                        document.getElementById("pickupLat").value = latlng.lat;
                        document.getElementById("pickupLng").value = latlng.lng;
                    } else {
                        document.getElementById("dropoff").value = locationName;
                        document.getElementById("dropoffLat").value = latlng.lat;
                        document.getElementById("dropoffLng").value = latlng.lng;
                    }
                    calculateFare();
                })
                .catch(error => console.log("Geocoding Error: ", error));
        }

        function calculateFare() {
            let pickupLat = document.getElementById("pickupLat").value;
            let dropoffLat = document.getElementById("dropoffLat").value;

            if (pickupLat && dropoffLat) {
                let lat1 = parseFloat(pickupLat);
                let lon1 = parseFloat(document.getElementById("pickupLng").value);
                let lat2 = parseFloat(dropoffLat);
                let lon2 = parseFloat(document.getElementById("dropoffLng").value);

                let distance = getDistance(lat1, lon1, lat2, lon2);
                let estimatedFare = 200 + (50 * distance); // Base Fare: 200 LKR + 50 LKR per km
                document.getElementById("fare").value = estimatedFare.toFixed(2);
            }
        }

        function getDistance(lat1, lon1, lat2, lon2) {
            var R = 6371;
            var dLat = (lat2 - lat1) * Math.PI / 180;
            var dLon = (lon2 - lon1) * Math.PI / 180;
            var a = Math.sin(dLat / 2) ** 2 +
                    Math.cos(lat1 * Math.PI / 180) * Math.cos(lat2 * Math.PI / 180) *
                    Math.sin(dLon / 2) ** 2;
            var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
            return R * c;
        }

        document.getElementById("rideType").addEventListener("change", function() {
            document.getElementById("scheduledTimeContainer").style.display =
                this.value === "Scheduled" ? "block" : "none";
        });
    </script>

</body>
</html>
