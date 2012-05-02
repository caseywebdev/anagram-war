Backbone = require 'backbone'

@include = ->
  @shared '/javascripts/room.js': ->
    
    root = window ? global
    z = @
    
    class root.Room extends Backbone.Model
      
    class root.Room.Collection extends Backbone.Collection
      
      model: Room
