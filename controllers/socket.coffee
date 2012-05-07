_ = require 'underscore'

@include = ->
  
  users = new User.Collection
  battles = new Battle.Collection
  
  @on connection: ->
    @client.user = new User socketId: @id
    @emit users: users.toJSON()
    @broadcast users: users.toJSON()

  @on disconnect: ->
    if name = @client.user.get 'name'
      if @client.user.get 'inBattle'
        battle = battles.filter((battle) ->
          battle.get('users').where(name: name).length
        )[0]
        opponent = battle.get('users').find (u) ->
          u.get('name') isnt name
        clearTimeout battle.get 'timeout'
        battle.destroy()
        opponent.set inBattle: false
        @broadcast notice:
          text: "#{_.escape opponent.get 'name'} defeated #{_.escape name} by forfeit!"
        @io.sockets.socket(opponent.get 'socketId').emit 'battleOver'
      @broadcast notice:
        text: "#{name} has disconnected."
      @client.user.destroy()
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
  
  @on challenge: ->
    socketId = users.where(name: @data.name2)[0].get 'socketId'
    @io.sockets.socket(socketId).emit 'challenge', name1: @data.name1
  
  @on acceptChallenge: ->
    user1 = users.where(name: @data.name1)[0]
    user2 = @client.user
    battle = new Battle
      users: new User.Collection [user1, user2]
      rack: (new Rack).randomize()
    battles.add battle
    user1.set
      inBattle: true
      words: []
    user2.set
      inBattle: true
      words: []
    @emit users: users.toJSON()
    @broadcast users: users.toJSON()
    @emit 'battle', battle: battle.toJSON()
    @io.sockets.socket(user1.get 'socketId').emit 'battle', battle: battle.toJSON()
    battle.set timeout: setTimeout =>
      user1.set inBattle: false
      user2.set inBattle: false
      @emit 'battleOver'
      @io.sockets.socket(user1.get 'socketId').emit 'battleOver'
      scores = battle.scores()
      if scores[0] is scores[1]
        data = text: "#{_.escape user1.get 'name'} and #{_.escape user2.get 'name'} tied with a score of #{scores[0]}!"
      else if scores[0] > scores[1]
        data = text: "#{_.escape user1.get 'name'} defeated #{_.escape user2.get 'name'} with a score of #{scores[0]} to #{scores[1]}!"
      else
        data = text: "#{_.escape user2.get 'name'} defeated #{_.escape user1.get 'name'} with a score of #{scores[1]} to #{scores[0]}!"
      @emit notice: data
      @broadcast notice: data
      @emit users: users.toJSON()
      @broadcast users: users.toJSON()
      battle.destroy()
    , Battle.DURATION
  
  @on declineChallenge: ->
    user1 = users.where(name: @data.name1)[0]
    @io.sockets.socket(user1.get 'socketId').emit 'declineChallenge', name2: @client.user.get 'name'
  
  @on play: ->
    name = @client.user.get 'name'
    word = @data.word
    battle = battles.find (battle) ->
      battle.get('users').where(name: name).length
    unless Rack.wordValue word
      @emit 'notAWord'
    else if battle.wordPlayed word
      @emit 'alreadyPlayed'
    else
      @client.user.get('words').push word
      opponent = battle.get('users').find (u) ->
        u.get('name') isnt name
      user1 = battle.get('users').models[0]
      user2 = battle.get('users').models[1]
      data =
        user1: user1.toJSON()
        user2: user2.toJSON()
      @emit 'playedWord'
      @emit play: data
      @io.sockets.socket(opponent.get 'socketId').emit 'play', data
  