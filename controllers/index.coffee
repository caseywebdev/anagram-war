@include = ->
  @get '/': ->
    @render 'index'
  
  @on 'set nickname': ->
    @client.nickname = @data.nickname
  
  @on said: ->
    @broadcast said: {nickname: @client.nickname, text: @data.text}
    @emit said: {nickname: @client.nickname, text: @data.text}