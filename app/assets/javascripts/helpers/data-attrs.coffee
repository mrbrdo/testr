RT.Helpers.DataAttrs =

  access_token: ->
    token = $('body').data('api-token')
    if token.length > 0 then token else null

  api_root: ->
    $('body').data('api-root')
