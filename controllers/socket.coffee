_ = require 'underscore'

@include = ->
  
  users = new User.Collection
  battles = new Battle.Collection
  
  @on connection: ->
    @client.user = new User
    @emit users: users.toJSON()
    @broadcast users: users.toJSON()

  @on disconnect: ->
    if name = @client.user.get 'name'
      @broadcast notice:
        battle: @client.user.get 'battle'
        text: "#{name} has disconnected."
      @client.user.destroy()
      @emit users: users.toJSON()
      @broadcast users: users.toJSON()
  
  @on attr: ->
    if @client.user.get 'name'
      @client.user.set @data
      @emit attr: @client.user.attributes
    else
      name = (@data.name or '')
        .replace(/\s+/, ' ')
        .replace(/^ | $/, '')[0...16]
      matches = users.filter (u) ->
        u.get('name').toLowerCase() is name.toLowerCase()
      if name and not matches.length
        @client.user.set
          name: name
        users.add @client.user
        @emit attr: @client.user.attributes
        @emit notice:
          text: "Welcome to Anagram War, #{_.escape name}!"
        @broadcast notice:
          text: "#{_.escape name} has connected."
        @emit users: users.toJSON()
        @broadcast users: users.toJSON()
        @emit 'signedIn'
      else
        @emit 'nameUnavailable'
    
  
  @on say: ->
    text = @data.text.replace(/\s+/, ' ').replace /^ | $/, ''
    if text
      data =
        name: @client.user.get 'name'
        text: text
      @broadcast say: data
      @emit say: data

  @on room: ->
    #if @client.user.get('battle') isnt @data
      
  
  
  