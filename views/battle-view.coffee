_ = require 'underscore'
Backbone = require 'backbone'

@include = ->
  @coffee '/js/views/battle-view.js': ->
        
    class window.BattleView extends Backbone.View
            
      el: '#main'
      
      template: _.template '''
        <div id='played-tiles'></div>
        <div id='user1-container'>
          <div id='name'><%= users.models[0].get('name') %></div>
          <div id='score'>0</div>
          <div id='words'></div>
        </div>
        <div id='rack'>
          <% rack.each(function(tile) { %>
            <div class='tile'><%= tile.get('letter') %>
          <% }) %>
        </div>
        <div id='user2-container'>
          <div class='name'><%= users.models[0].get('name') %></div>
          <div class='score'>0</div>
          <div class='words'></div>
        </div>
        <div style='clear: both'></div>
      '''
      
      render: ->
        @$el.html @template @model
        @
