Map =
  init: ->
    @map = L.map('map')
    @addMapLayer()
    @map.locate({setView: true, maxZoom: 16})
    @addMarkers()
    @newConvoMarker()


  newConvoMarker: ->
    @map.on "click", (e) =>
      # new_convo_url = "<a href='users/#{ gon.current_user.id }/convos/new/?lat=#{ e.latlng['lat'] }&lng=#{ e.latlng['lng'] }'>Start a new convo here</a>"

      # removes last marker if a new marker is dropped
      @map.removeLayer @marker if @marker
      @createMarker(e);

      # makes marker draggable and opens a new popup
      @marker.on "dragend", (e) =>
        new_convo_url = "<a href='users/#{gon.current_user}/convos/new/?lat=" +
          e.target._latlng["lat"] + "&lng=" +
          e.target._latlng["lng"] + "'>" +
          "Start a new convo here</a>"
        @marker.bindPopup(new_convo_url).addTo(@map).openPopup()

  createMarker: (e) ->
    new_convo_url = "<a href='users/#{ gon.current_user.id }/convos/new/?lat=#{ e.latlng['lat'] }&lng=#{ e.latlng['lng'] }'>Start a new convo here</a>"
    @marker = new L.Marker(e.latlng,
          draggable: true
        )
        @map.addLayer @marker
        @marker.bindPopup(new_convo_url).addTo(@map).openPopup()

  addMapLayer: ->
    L.tileLayer("http://{s}.tile.osm.org/{z}/{x}/{y}.png",
      attribution: "&copy; <a href=\"http://osm.org/copyright\">OpenStreetMap</a> contributors"
      ).addTo @map

  addMarkers: ->
    for index of gon.coordinates
      # Temporary if statement for dev purposes
      if gon.coordinates[index][0]?
        L.marker(gon.coordinates[index]).addTo(@map).bindPopup "<strong>
          #{gon.category[index]}</strong><br>
          #{gon.description[index]}<br><a href='users/
          #{gon.user[index]}/convos/#{[index]}'>Go to convo</a>"

window.onload = ->
  Map.init()