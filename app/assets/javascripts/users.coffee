# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# 
Gmaps.store = {} #handler, markers, userPin, eventPin
jQuery ->
  $('body').ready ->
    if $('#map').length > 0
      var base_url = "http://gmaps-utility-library.googlecode.com/svn/trunk/markerclusterer/1.0/images/";

      handler = Gmaps.build(
        "Google"
        markers:
          clusterer:
            gridSize: 40
            maxZoom: 10
            styles: [
              textSize: 10
              textColor: '#ff0000'
              url: base_url + 'heart30.png'
              height: 26
              width: 30
            ,
              textSize: 14 
              textColor: '#ffff00'
              url: base_url + 'heart40.png' 
              height: 35
              width: 40
            ,
             textSize: 18 
             textColor: '#0000ff'
             url: base_url + 'heart50.png'
             width: 50
             height: 44
            ]
      )
      handler.buildMap
        provider: {}
        internal:
          id: "map"
      , ->
        markers = handler.addMarkers( $('#map').data('users'))
        Gmaps.store.markers = markers
        handler.bounds.extendWith markers
        handler.fitMapToBounds()