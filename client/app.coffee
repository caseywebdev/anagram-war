@include = ->
  @client '/js/app.js': ->
    
    @connect()
    
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
        .scrollTop $('#chat-log').prop 'scrollHeight'
    
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
      user.set
        inBattle: true
        words: []
      _.PopUp.hide()
      battle = new Battle @data.battle
      battle.set
        users: new User.Collection battle.get 'users'
        rack: new Rack battle.get 'rack'
      (new BattleView model: battle).render()
      playMessage 'green', 'GO!!!'
      setTimeout ->
        secondsLeft = 10
        countdown = setInterval ->
          console.log 'tick'
          playMessage 'green', "#{secondsLeft} seconds left!!!"
          clearInterval countdown if --secondsLeft < 1
        , 1000
      , Battle.DURATION - 11*1000
    
    @on declineChallenge: ->
      _.PopUp.show "#{_.escape @data.name2} declined your challenge.", duration: 2000
    
    @on battleOver: ->
      user.set inBattle: false
      lobby()
    
    @on play: ->
      battle.get('users').reset [@data.user1, @data.user2]
      user.set if user.get('name') is @data.user1.name then @data.user1 else user.set @data.user2
      $('#user1-container .score').html Rack.wordValue @data.user1.words
      $('#user1-container .words')
        .html(_.reduce @data.user1.words, (html, word) ->
          html + "<strong>#{Rack.wordValue word}</strong> #{word}<br>"
        , '')
        .scrollTop $('#user1-container .words').prop 'scrollHeight'
      $('#user2-container .score').html Rack.wordValue @data.user2.words
      $('#user2-container .words')
        .html(_.reduce @data.user2.words, (html, word) ->
          html + "<strong>#{Rack.wordValue word}</strong> #{word}<br>"
        , '')
        .scrollTop $('#user2-container .words').prop 'scrollHeight'
    
    @on alreadyPlayed: ->
      alreadyPlayed()
    
    alreadyPlayed = ->
      playMessage 'red', 'Already played!'
    
    @on notAWord: ->
      notAWord()
    
    notAWord = ->
      playMessage 'red', 'Not a word!'
    
    @on playedWord: ->
      playedWord()
    
    playedWord = ->
      playMessage 'green', 'Played word!'
    
    tooShort = ->
      playMessage 'red', 'Word too short!'
    
    playMessage = (color, text) ->
      $('#play-message')
        .removeClass()
        .addClass(color)
        .text(text)
        .stop()
        .css(
          opacity: 1
          display: 'block'
        ).animate opacity: 0, 1000, -> $(@).css display: 'none'
        
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
      
      lastChar = ''
            
      $(document).on('keydown', (e) =>
        if user.get 'inBattle'
          if e.keyCode is 8
            battle.get('rack').removeLast()
            $("#played-tiles .tile").last().appendTo $ '#rack'
            e.preventDefault()
            lastChar = ''
          else if e.keyCode is 13
            word = battle.get('rack').word()
            if word.length > 0
              if word.length < 3
                tooShort()
              else unless Rack.wordValue
                notAWord()
              else if battle.wordPlayed word
                alreadyPlayed()
              else
                @emit play:
                  word: word
              battle.get('rack').removeAll()
              $("#played-tiles .tile").appendTo $ '#rack'
            lastChar = ''
          else
            char = String.fromCharCode e.keyCode
            unless lastChar is 'Q' and char is 'U'
              if battle.get('rack').play char
                $("#rack .letter-#{char}").first().appendTo $ '#played-tiles'
            lastChar = char
      )
