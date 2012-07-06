jQuery ->

  $('a').live 'click', -> 
    $(this).attr('target', '_blank')