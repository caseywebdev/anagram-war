@include = ->
  @client '/js/app.js': ->
    
    io = @connect()
        
    Backbone.sync = ->
    
    users = new User.Collection
    user = new User
    messages = []
    battle = new Battle
    
    say = (name, text) ->
      chatAppend MessageView.say name, text
    
    notice = (text) ->
      chatAppend MessageView.notice text

    chatAppend = (view) ->
      messages.push view
      $('#chat-log')
        .append(view.$el)
        .scrollTop $('#chat-log')[0].scrollHeight
    
    lobby = ->
      (new LobbyView model:
        users: users
        messages: messages
      ).render()
    
    signIn = (error) ->
      (new SignInView model: error: error).render()
    
    @on connect: ->
      notice 'Connected to Anagram War.'
    
    @on disconnect: ->
      users.reset()
      notice 'Your connection to Anagram War was lost.'
      lobby()
      signIn if user.get 'name' then 'You were disconnected.' else null
      user = new User
    
    @on error: ->
      notice "An error occurred. #{@data}"
            
    @on attr: ->
      user.set @data
    
    @on signedIn: ->
      _.PopUp.hide()
      $('#say').val('').focus()
    
    @on notice: ->
      notice @data.text
    
    @on say: ->
      say @data.name, @data.text
    
    @on users: ->
      users.reset @data
      $('#users-list').empty()
      users.each (user) ->
        $('#users-list').append (new UserView model: user).render().$el
    
    @on nameUnavailable: ->
      signIn 'That name is unavailable.'
    
    @on challenge: ->
      user1 = users.where(name: @data.name1)[0]
      (new ChallengeView model: name1: user1.get 'name').render()
    
    @on battle: ->
      battle.set @data
      (new BattleView model: battle).render()
    
    @on declineChallenge: ->
      _.PopUp.show "#{_.escape @data.name2} declined your challenge.", duration: 2000
    
    $ =>
      
      lobby()
      
      signIn()
      
      $('body').on('keydown', '#say', (e) =>
        if e.keyCode is 13
          text = $('#say').val()
          if user.get 'name'
            @emit say:
              text: text
          else
            notice "You are not signed in."
          $('#say').val('').focus()
      ).on('keydown', '#sign-in', (e) =>
        if e.keyCode is 13
          text = $('#sign-in').val()
          unless user.get 'name'
            _.PopUp.show "Signing in as #{text}..."
            @emit attr:
              name: text
      ).on('click', '.user', (e) =>
        user2 = users.where(name: $(e.currentTarget).text())[0]
        unless user.get('name') is user2.get 'name'
          if user2.get 'inBattle'
            _.PopUp.show "#{_.escape user2.get 'name'} is in a battle.", duration: 2000
          else
            _.PopUp.show "Waiting for #{_.escape user2.get 'name'} to accept or decline your challenge."
            @emit challenge:
              name1: user.get 'name'
              name2: user2.get 'name'
      ).on('click', '#accept-challenge', (e) =>
        _.PopUp.hide()
        @emit acceptChallenge:
          name1: $(e.currentTarget).data 'name1'
      ).on('click', '#decline-challenge', (e) =>
        _.PopUp.hide()
        @emit declineChallenge:
          name1: $(e.currentTarget).data 'name1'
      )
