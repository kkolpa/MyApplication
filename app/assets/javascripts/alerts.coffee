$(document).on 'turbolinks:load', ->
    $(".alert").delay(2500).slideUp 500, ->
          $(".alert").alert 'close';
