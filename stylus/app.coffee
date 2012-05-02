@include = ->
  @stylus '/css/app.css': '''
    noise = url('/images/noise.png')
    
    body
      color: #fff
      background: #630 noise
    
    .container
      margin: 0 auto
      width: 800px
    
      #header
        width: 800px
        height: 150px
        background: url('/images/header.png') no-repeat
      
      #main
        width: 800px
        padding-bottom: 175px
        background: url('/images/footer.png') center bottom no-repeat
      
  '''