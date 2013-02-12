class RT.Views.LoginForm extends Backbone.View
  events: ->
    'submit': 'submit'

  initialize: ->
    $('body').css('background', '#eee')
    @model = new RT.Models.Session()
    @modelBinder = new Backbone.ModelBinder()
    @setup()

  setup: ->
    @listenTo @model, 'validated', @handleValidation

  teardown: ->
    $('body').css('background', 'none')
    @modelBinder.unbind()
    Backbone.Validation.unbind(this)
    @unbind()
    @remove()

  template: ->
    JST['forms/login']()

  render: ->
    @$el.html @template()
    @modelBinder.bind @model, @$el
    Backbone.Validation.bind(this)
    @$el

  handleSuccess: =>
    H.reload_and_go_to_root()

  handleErrors: (model, xhr)=>
    resp = $.parseJSON(xhr.responseText)
    if resp.error?
      $('#flash_messages').append("<div class='alert alert-error'>#{resp.error}</div>").slideDown()
    H.show_errors_from_response(@$el, model)

  handleValidation: (is_valid, model, attrs)=>
    H.show_validation_errors(@$el, attrs)

  submit: (e)->
    e.preventDefault()
    if @model.isValid(true)
      @model.save null
        success: @handleSuccess
        error: @handleErrors
