WebApp.Helpers.Alerts =
  alert_dismissable_error: (content)->
    content = '<button type="button" class="close" data-dismiss="alert">&times;</button>' + content
    notice_div = $("<div class='alert alert-error'></div>")
    notice_div.html(content)
    $("#flash_messages").append(notice_div)
    $("#flash_messages").css('display', 'block')
    window.scrollTo(0, 0)
