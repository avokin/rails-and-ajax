# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

CSS_CLASS_JSON_PROJECT_FORM = "#json_project_form form"

bindAjaxEvents = (element) ->
  element.bind("ajax:before", ->
    #do something
  )

  element.bind("ajax:complete", ->
    #do something
  )

  element.bind("ajax:success", (a, data, c) ->
    if data.status is "error"
      message = ""
      for key of data.errors
        message += key + ": " + data.errors[key]

      $("#flash_notice").hide(300)
      $("#project_errors").html(message)
      $("#project_errors").show(300)
    else
      $("#project_errors").hide(300)
      #$("#flash_notice").html(data.flash)
      #$("#flash_notice").show(300)
      $(":input:not(input[type=submit])").val("")
      table_body = $("tbody", "#projects_list")
      new_row = $("<tr><td>#{data.addedProject.name}</td><td>#{data.addedProject.description}</td><td><a href='#{data.addedProject.editUrl}' data-remote='true'>Edit</a></td><td><a href='#{data.addedProject.deleteUrl}' data-confirm='Are you sure?' data-method='delete' data-remote='true' rel='nofollow'>Delete</a></td></tr>")
      new_row.appendTo(table_body)
  )

  element.bind("ajax:error", (a, b, error) ->
      alert("ajax:error" + error)
  )

$ ->
  bindAjaxEvents($(CSS_CLASS_JSON_PROJECT_FORM))