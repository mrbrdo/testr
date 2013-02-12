class RT.Models.Session extends Backbone.Model
  urlRoot: ->
    $('body').data('session-root')

  validation:
    email:
      required: true
    password:
      required: true

  toJSON: ->
    json = {
      email: @get('email'),
      password: @get('password')
    }
    json.remember_me = true if @get('remember_me')?
    json