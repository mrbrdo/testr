WebApp.Helpers.Form =
  mark_fields_as_invalid: (fields, el)->
    _.each fields, (name)->
      el.find("input[name='#{name}']").addClass 'invalid'
      el.find("select[name='#{name}']").addClass 'invalid'

  remove_invalid_markers: (el)->
    el.find('input').removeClass 'invalid'
    el.find('select').removeClass 'invalid'

  show_validation_errors: ($el, attrs)->
    Object.keys(attrs).each (attr)->
      $label = $el.find("span.#{attr}-label")
      $input = $el.find("input[name='#{attr}']")
      error = $input.data('error')
      if error?
        $label.text error.capitalize()

  show_errors_from_response: ($el, model)->
    H.mark_fields_as_invalid Object.keys(model.attributes), $el

