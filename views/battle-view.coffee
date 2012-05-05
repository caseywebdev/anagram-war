_ = require 'underscore'
Backbone = require 'backbone'

@include = ->
  @coffee '/js/views/battle-view.js': ->
        
    class window.BattleView extends Backbone.View
            
      el: '#main'
      
      template: _.template '''
        <div id='played-tiles'></div>
        <div id='user1-container'>
          <div class='name'><%= get('users').models[0].get('name') %></div>
          <div class='score'>0</div>
          <div class='words'></div>
        </div>
        <div id='rack'>
          <% get('rack').each(function(tile, i) { if (i > 0 && !(i % 4)) print('<br>'); %><div class='tile'><%= tile.get('letter') %></div><% }) %>
        </div>
        <div id='user2-container'>
          <div class='name'><%= get('users').models[1].get('name') %></div>
          <div class='score'>0</div>
          <div class='words'></div>
        </div>
        <div style='clear: both'></div>
      '''
      
      render: ->
        console.log @model
        @$el.html @template @model
        @
