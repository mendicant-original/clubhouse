$ ->
  $(".edit_person").on "submit", ->
    $(".permission-collection option:selected").each ->
      if $(this).text() is "(none)"
        parent = $(this).parents(".permission-collection")
        parent.append(
          "<input type='hidden' name='#{parent.data("object-name")}[_destroy]' value='true' />"
        )
