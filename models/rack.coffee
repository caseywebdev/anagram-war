Backbone = require 'backbone'

@include = ->
  @shared '/js/models/tile.js': ->
    
    root = window ? global
    
    class root.Rack extends Backbone.Collection
      
      model: Tile
      
      played: []
      
      random: ->
        @reset()
        basket = []
        _.each Tile.DISTRIBUTION, (occurances, letter) ->
          _.times occurances, ->
            basket.push letter
        _.times Tile.COUNT, =>
          randomI = Math.floor Math.random() * basket.length
          @add new Tile letter: basket[randomI]
          basket.splice randomI, 1
        @
      
      word: ->
        @reduce (letters, tile) ->
          letters += tile.get 'letter' if tile.get 'isPlayed'
          letters
        , ''
      
      validWord: ->
        Dictionary.hasWord @word()
      
      value: ->
        wordSize = @reduce (total, tile) ->
          total += title.get('letter').length if tile.get 'isPlayed'
          total
        , 0
      
      play: (letter) ->
        letter = 'qu' if letter == 'q'
        for tile in @models
          if tile.get('letter') is letter and not tile.get 'isPlayed'
            @remove tile
            @add tile
            return true
        false
