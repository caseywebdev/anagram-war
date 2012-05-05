_ = require 'underscore'
Backbone = require 'backbone'

@include = ->
  @coffee '/js/views/user-view.js': ->
        
    class window.UserView extends Backbone.View
      
      tagName: 'a'
       
      className: 'user'
      
      template: _.template '''
        <%- get('name') %>
      '''
      
      render: ->
        @$el.html(@template @model)
          .removeClass('in-battle')
        @$el.addClass 'in-battle' if @model.inBattle
        @
