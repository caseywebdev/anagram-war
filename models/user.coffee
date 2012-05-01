Backbone = require 'backbone'

@include = ->
  @shared '/user.js': ->
    class (window ? global).User extends Backbone.Model
      urlRoot: '/users/'