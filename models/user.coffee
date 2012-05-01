Backbone = require 'backbone'
module.exports = ->
  @shared '/user.js': ->
    class (window ? global).User extends Backbone.Model
      urlRoot: '/users/'