_ = require 'underscore'
Backbone = require 'backbone'

@include = ->
  @coffee '/js/views/lobby-view.js': ->
        
    class window.LobbyView extends Backbone.View
            
      el: '#main'
      
      template: _.template '''
        <div id='users-container'>
          <h1>Users</h1>
          <p>Click on a user to battle them.</p>
          <div id='users-list'></div>
        </div><div id='chat-container'>
          <div id='chat-log'></div>
          <input id='say'>
        </div>
        <div style='clear: both'></div>
      '''
      
      render: ->
        @$el.html @template()
        @model.users.each (user) =>
          @$('#users-list').append (new UserView model: user).render().$el
        _.each @model.messages, (message) =>
          @$('#chat-log').append message.$el
        @
