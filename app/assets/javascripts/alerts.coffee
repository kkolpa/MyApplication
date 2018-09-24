$(document).on 'turbolinks:load', ->
    $(".alert").delay(1000).slideUp 500, ->
          $(".alert").alert 'close';
