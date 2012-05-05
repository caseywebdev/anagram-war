@include = ->
  
  words = @words
  
  @get '/': ->
    @render layout: words: words
  