Map =
  init: ->
    @map = L.map('map')
    @addMapLayer()
    @map.locate({setView: true, maxZoom: 16})
    @addMarkers()
    @newConvoMarker()

  addMapLayer: ->
    L.tileLayer("http://{s}.tile.osm.org/{z}/{x}/{y}.png",
      attribution: "&copy; <a href=\"http://osm.org/copyright\">OpenStreetMap</a> contributors"
      ).addTo @map

  addMarkers: ->
    for index of gon.coordinates
      # Temporary if statement for dev purposes
      if gon.coordinates[index][0]?
        L.marker(gon.coordinates[index]).addTo(@map).bindPopup "<strong>"+
          "#{gon.category[index]}</strong><br>"+
          "#{gon.description[index]}<br><a href='users/"+
          "#{gon.user[index]}/convos/#{[index]}'>Go to convo</a>"

  newConvoMarker: ->
    @map.on "click", (e) =>

      # removes last marker if a new marker is dropped
      @map.removeLayer @marker if @marker
      newConvoLink = @createLink(e)
      @createMarker(e, newConvoLink)

      # makes marker draggable and opens a new popup
      @marker.on "dragend", (e) =>
        newConvoLink = @createLink(e)
        @marker.bindPopup(newConvoLink).addTo(@map).openPopup()

  createLink: (e) ->
    if e.target._latlng then e.latlng = e.target._latlng
    "<a href='users/#{ gon.current_user.id }/convos/new/?lat="+
    "#{ e.latlng['lat'] }&lng=#{ e.latlng['lng'] }'>Start a new convo here</a>"

  createMarker: (e, link) ->
    @marker = new L.Marker(e.latlng,
          draggable: true
        )
        @map.addLayer @marker
        @marker.bindPopup(link).addTo(@map).openPopup()


window.onload = ->
  Map.init()