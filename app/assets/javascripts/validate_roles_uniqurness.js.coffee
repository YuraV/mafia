class window.ValidateRolesUniqurness

$ ->
  $(".put_role input").on "click", ->
    sheriff = $("input[id*=\"role_sherif\"]:not(:checked)").length
    don = $("input[id*=\"role_don\"]:not(:checked)").length
    mafia = $("input[id*=\"role_mafia\"]:not(:checked)").length

    $("input[id*=\"role_sherif\"]:not(:checked)").attr "disabled", true     if sheriff is 9
    $("input[id*=\"role_sherif\"]:not(:checked)").attr "disabled", false     unless sheriff is 9

    $("input[id*=\"role_don\"]:not(:checked)").attr "disabled", true if don is 9
    $("input[id*=\"role_don\"]:not(:checked)").attr "disabled", false unless don is 9

    $("input[id*=\"role_mafia\"]:not(:checked)").attr "disabled", true if mafia is 8
    $("input[id*=\"role_mafia\"]:not(:checked)").attr "disabled", false unless mafia is 8
