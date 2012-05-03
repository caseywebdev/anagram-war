Backbone = require 'backbone'

@include = ->
  @shared '/js/models/tile.js': ->
    
    root = window ? global
    
    class root.Tile extends Backbone.Model
      
    class root.Tile.Collection extends Backbone.Collection
      
      model: Tile
