class WebApp.Models.User extends Backbone.Model
  urlRoot: ->
    WebApp.api_root() + '/posts'
