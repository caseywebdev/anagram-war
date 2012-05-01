Backbone = require 'backbone'

@include = ->
  @shared '/javascripts/user.js': ->
    class (window ? global).User extends Backbone.Model
      urlRoot: '/users/'