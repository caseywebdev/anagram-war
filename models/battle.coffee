Backbone = require 'backbone'

@include = ->
  @shared '/js/models/battle.js': ->
    
    root = window ? global
    
    class root.Battle extends Backbone.Model
      
      wordPlayed: (word) ->
        @get('users').reduce (check, user) ->
          check or word in user.get 'words'
        , false
              
    class root.Battle.Collection extends Backbone.Collection
      
      model: Battle
