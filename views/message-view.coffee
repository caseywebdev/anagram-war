_ = require 'underscore'
Backbone = require 'backbone'

@include = ->
  @coffee '/js/views/message-view.js': ->
        
    class window.MessageView extends Backbone.View
            
      className: 'message'
      
      template: _.template '''
        <span class='timestamp'><%= MessageView.timestamp() %></span>
        <span class='<%= name ? 'name' : 'notice' %>'>
        <% if (name) { %>
          <%- name %></span> <%- text %>
        <% } else { %>
          <%= text %>
          </span>
        <% } %>
      '''
      
      render: ->
        @$el.html @template @model
        @
        
      @timestamp: ->
        time = new Date()
        hours = time.getHours()
        minutes = time.getMinutes()
        seconds = time.getSeconds()
        apm = if hours < 12 then 'AM' else 'PM'
        zeroFill = (n) -> if n < 10 then '0' + n else '' + n
        "#{zeroFill (hours % 12) or 12}:#{zeroFill minutes}:#{zeroFill seconds} #{apm}"
  
      @say: (name, text) ->
        (new MessageView
          model:
            name: name
            text: text
        ).render()
      
      @notice: (text) ->
        (new MessageView
          model:
            name: null
            text: text
        ).render()
