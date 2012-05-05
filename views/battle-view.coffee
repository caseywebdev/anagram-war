_ = require 'underscore'
Backbone = require 'backbone'

@include = ->
  @coffee '/js/views/battle-view.js': ->
        
    class window.BattleView extends Backbone.View
            
      el: '#main'
      
      template: _.template '''
        <div id='played-tiles'><div id='play-message'></div></div>
        <div id='user1-container'>
          <div class='name'><%= get('users').models[0].get('name') %></div>
          <div class='score'>0</div>
          <div class='words'></div>
        </div>
        <div id='rack'><%
          get('rack').each(function(tile, i) {
            %><div class='tile letter-<%= tile.get('letter')[0] %>'><%= tile.get('letter') %></div><%
          })
        %></div>
        <div id='user2-container'>
          <div class='name'><%= get('users').models[1].get('name') %></div>
          <div class='score'>0</div>
          <div class='words'></div>
        </div>
        <div style='clear: both'></div>
      '''
      
      render: ->
        @$el.html @template @model
        @
