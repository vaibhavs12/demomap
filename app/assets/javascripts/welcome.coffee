window.initMap = ->
  latitude = $('.data-var').data('lat')
  longitude = $('.data-var').data('lng')
  location = $('.data-var').data('location')
  iconURLPrefix = 'http://maps.google.com/mapfiles/ms/icons/'
  icons = [ iconURLPrefix + 'orange-dot.png' ]
  iconsLength = icons.length
  infowindow = new (google.maps.InfoWindow)(maxWidth: 160)
  map = new (google.maps.Map)(document.getElementById('map'),
    minZoom: 2
    zoom: 2
    center:
      lat: latitude
      lng: longitude
    scrollwheel: false
    draggable: false)
  markers = new Array
  iconCounter = 0
  i = 0
  infowindow = new (google.maps.InfoWindow)(maxWidth: 160)
  while i < location.length
    marker = new (google.maps.Marker)(
      position: new (google.maps.LatLng)(location[i][0], location[i][1])
      map: map,
      icon: location[i][3])
    markers.push marker
    google.maps.event.addListener marker, 'click', do (marker, i) ->
      ->
      infowindow.setContent '<img src="' + location[i][3] + '"/>' + location[i][2]
      infowindow.open map, marker
    iconCounter++
    if iconCounter >= iconsLength
      iconCounter = 0
    i++
  google.maps.event.addListener map, 'zoom_changed', (event) ->
    @setOptions scrollwheel: true
    @setOptions draggable: true
  markerCluster = new MarkerClusterer(map, markers, imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m')
return
