Backbone = require 'backbone'

@include = ->
  @shared '/js/models/battle.js': ->
    
    root = window ? global
    
    class root.Battle extends Backbone.Model
      
    class root.Battle.Collection extends Backbone.Collection
      
      model: Battle
