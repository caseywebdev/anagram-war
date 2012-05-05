Backbone = require 'backbone'

@include = ->
  @shared '/js/models/battle.js': ->
    
    root = window ? global
    
    class root.Battle extends Backbone.Model
      
      # In miliseconds for javascript's sake
      # 2 minutes
      @DURATION: 2*60*1000
      
      wordPlayed: (word) ->
        @get('users').reduce (check, user) ->
          check or word in user.get 'words'
        , false
      
      scores: ->
        [
          Rack.wordValue @get('users').models[0].get 'words'
          Rack.wordValue @get('users').models[1].get 'words'
        ]
      
    class root.Battle.Collection extends Backbone.Collection
      
      model: Battle
