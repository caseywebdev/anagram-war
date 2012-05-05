_ = require 'underscore'
Backbone = require 'backbone'

@include = ->
  @coffee '/js/views/challenge-view.js': ->
        
    class window.ChallengeView extends Backbone.View
      
      template: _.template '''
        <p><%- name1 %> has challenged you!</p>
        <a id='accept-challenge' data-name1='<%- name1 %>'>Accept</a> <a id='decline-challenge' data-name1='<%- name1 %>'>Decline</a>
      '''
      
      render: ->
        _.PopUp.show @$el.html @template @model
        @
