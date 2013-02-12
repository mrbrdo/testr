WebApp.Helpers.Navigation =
  go_to: (path)->
    WebApp.router.navigate(path, trigger: true)

  go_back_or_to_root: ->
    if WebApp.current_view?
      window.history.back()
    else
      @go_to('/')

  reload_and_go_to_root: ->
    window.location.href = '/'

  go_to_login: ->
    window.location.href = '/users/sign_in'