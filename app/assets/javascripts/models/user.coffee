class RT.Models.User extends Backbone.Model
  url: ->
    RT.api_root() + '/user'