<<<<<<< HEAD
// $( document ).ready(function() {
class RichMarkerBuilder extends Gmaps.Google.Builders.Marker #inherit from builtin builder
  #override create_marker method
  create_marker: ->
    options = _.extend @marker_options(), @rich_marker_options()
    @serviceObject = new RichMarker options #assign marker to @serviceObject

  rich_marker_options: ->
    boxText = document.createElement("div")
    boxText.setAttribute("class", 'yellow') 
    boxText.innerHTML = @args.infowindow
 _.extend(@marker_options(),{content:boxText})

    @buildMap = (markers)->
  handler = Gmaps.build('Google'),{builders:{Marker:RichMarkerBuilder}}
  handler.buildMap{ provider: {}, internal: {id: 'map'}}, ->
  	
    markers = handler.addMarkers(allMarkers);
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
  });
=======
$( document ).ready(function() {
  if ($("#map").length >= 1 ) {
    handler = Gmaps.build('Google'); //, builders: { Marker: CustomMarkerBuilder }

    handler.buildMap({ provider: {}, internal: {id: 'map'}}, 
      function(){
      var addedTogether = allMarkers.concat(allMarkersTwo);
      markers = handler.addMarkers(addedTogether);
      handler.bounds.extendWith(markers);
      handler.fitMapToBounds();
      handler.getMap().setZoom(17);
    });
  }
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> fdc9f16ec159b30298489150ed4ff43e7f9d000d
=======
>>>>>>> 3b44cf9babc3bcd5be61d36e1f57ec8a3a71232d
>>>>>>> jj
=======
>>>>>>> ca650d1bd66f7d3026a081b15ce6a7d5c823ca9a
});

