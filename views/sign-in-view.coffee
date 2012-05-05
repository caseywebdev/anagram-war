_ = require 'underscore'
Backbone = require 'backbone'

@include = ->
  @coffee '/js/views/sign-in-view.js': ->
        
    class window.SignInView extends Backbone.View
      
      template: _.template '''
        <% if (error) { %>
          <div class='error'><%= error %></div>
        <% } %>
        Please enter your name to sign in<br>
        <input id='sign-in'>
      '''
      
      render: ->
        _.PopUp.show @$el.html @template @model
        @$('#sign-in').focus()
        @
