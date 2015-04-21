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
<<<<<<< HEAD
  handler = Gmaps.build('Google');
  handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
    markers = handler.addMarkers([
    {
    
      "picture": {
        "url": "https://addons.cdn.mozilla.net/img/uploads/addon_icons/13/13028-64.png",
        "width":  36,
        "height": 36
      },
      "infowindow": "hello!"
    }
  ]);
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
  });
=======

  if ($("#map").length >= 1 ) {
    handler = Gmaps.build('Google');
    handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
      markers = handler.addMarkers(allMarkers);
      handler.bounds.extendWith(markers);
      handler.fitMapToBounds();
    });
  }
<<<<<<< HEAD
>>>>>>> fdc9f16ec159b30298489150ed4ff43e7f9d000d
=======
>>>>>>> 3b44cf9babc3bcd5be61d36e1f57ec8a3a71232d
>>>>>>> jj
});

