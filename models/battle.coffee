Backbone = require 'backbone'

@include = ->
  @shared '/js/models/battle.js': ->
    
    root = window ? global
    
    class root.Battle extends Backbone.Model
      
      rack: new Rack
      
      users: new User.Collection
      
    class root.Battle.Collection extends Backbone.Collection
      
      model: Battle
