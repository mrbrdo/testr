class WebApp.Models.User extends Backbone.Model
  url: ->
    WebApp.api_root() + '/users'

  initialize: ->
    @set('password', '')
    @set('password_confirmation', '')