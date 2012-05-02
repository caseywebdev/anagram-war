_ = require 'underscore'
Backbone = require 'backbone'

@include = ->
  @coffee '/javascripts/views/lobby.js': ->
        
    class window.LobbyView extends Backbone.Model
      
      template: _.template '''
        
        
      '''
      
      render: ->
        @$el.html @template @model
        @