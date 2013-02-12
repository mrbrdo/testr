class WebApp.Views.Dashboard extends Backbone.View
  events: ->
    'submit form': 'submit'

  initialize: ->
    @collection = new WebApp.Collections.Posts()
    @modelBinder = new Backbone.ModelBinder()
    @listenTo @model, 'validated', @handleValidation

  teardown: ->
    @modelBinder.unbind()
    Backbone.Validation.unbind(this)

  context: ->
    variable: "Hello world"

  template: ->
    JST['dashboard'](@context())

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
