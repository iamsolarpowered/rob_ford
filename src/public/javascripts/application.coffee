angular.module 'RobFord', []

window.RobFordController = ($scope) ->

  $scope.search = ->
    $('.tweets').fadeTo(0, 0.0)

    url = "https://search.twitter.com/search.json?q=#{escape $scope.search_terms}&callback=?"
    $.getJSON url, (response) ->
      # console.log response if window.console

      $scope.$apply -> $scope.tweets = response.results

      $.getScript '//platform.twitter.com/widgets.js', ->
        $('.tweets').delay(300).fadeTo('fast', 0.9)


  # Default search
  $scope.search_terms = '@tomayorford OR "Rob Ford" OR "Mayor Ford" OR #robford -RT'
  $scope.search()


jQuery ->

  # Open links in new tab
  $('a').live 'click', -> 
    $(this).attr('target', '_blank')