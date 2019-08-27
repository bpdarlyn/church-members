import 'select2';

let map;
let markerPosition = null;
$(document).ready(() => {
    $('.js-custom-select').select2();
    map = new google.maps.Map(document.getElementById('google-location'), {
        center: {lat: -17.839975, lng: -63.174357},
        zoom: 13
    });
    google.maps.event.addListener(map, 'click', function (event) {
        addMarker(event.latLng);
    });

    let lat = parseFloat($('#meeting_location_attributes_lat').val());
    let lng = parseFloat($('#meeting_location_attributes_lng').val());
    if (lat && lng) {
        let positionBoundary = new google.maps.LatLng(lat, lng);
        addMarker(positionBoundary);
        map.setCenter(positionBoundary);
    }
});

function addMarker(location) {
    if (markerPosition) {
        markerPosition.setMap(null);
    }
    $('#meeting_location_attributes_lat').val(location.lat());
    $('#meeting_location_attributes_lng').val(location.lng());
    markerPosition = new google.maps.Marker({
        position: location,
        map: map
    });
}