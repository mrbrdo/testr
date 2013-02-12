RT.Helpers.Navigation =
  go_to: (path)->
    RT.router.navigate(path, trigger: true)

  go_back_or_to_root: ->
    if RT.current_view?
      window.history.back()
    else
      @go_to('/')

  reload_and_go_to_root: ->
    window.location.href = '/'
