@include = ->
  @stylus '/css/app.css': '''
    noise = url('/images/noise.png')
    container-width = 800px
    container(width = container-width)
      margin: 0 auto
      width: width
    
    body
      color: #fff
      background: #630 noise
      font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif
      font-weight: 200
      font-size: 14px
    
    a
      text-decoration: none
    
    p
      margin: 0 0 10px
    
    #sky
      min-width: container-width
      background: #ccf url('/images/sky.jpg') center bottom repeat-x
      box-shadow: 0 1px 50px #000
    
    #header
      container()
      height: 150px
      background: url('/images/header.png') no-repeat
    
    #main
      container()
      padding-bottom: 200px
      min-height: 400px;
      background: url('/images/footer.png') center bottom no-repeat
    
    #footer
      container(container-width - 100px)
      padding: 50px
      color: #eee
      text-align: center
      text-shadow: 0 1px 1px rgba(0, 0, 0, .75)
      font-size: 12px
      
      a
        color: #eee
        
        &:hover
          color: #fff
          text-decoration: underline
  '''