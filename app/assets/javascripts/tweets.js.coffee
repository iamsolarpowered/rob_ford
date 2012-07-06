jQuery ->
  
  Tweets = 

    search_attributes:
        q: '@tomayorford OR robford OR "Rob Ford" OR "Mayor Ford" -RT'
        rpp: 42
        result_type: 'recent'


    fetch: ->
      $.ajax
        url: 'http://search.twitter.com/search.json'
        data: this.search_attributes
        dataType: 'jsonp'
        success: this.render

    render: (json) ->
      $('.tweets').hide();
      $.each json.results, (_, tweet) ->
        el = $('.templates .twitter-tweet').first().clone()
        datetime = new Date(tweet.created_at)
        $('p', el).html(tweet.text)
        $('a', el).attr('href', 'https://twitter.com/twitterapi/status/' + tweet.id_str)
          .attr('data-datetime', datetime.toISOString())
          .text(tweet.created_at)
        $('.tweets').append(el)
      $.getScript '//platform.twitter.com/widgets.js', ->
        $('.tweets').fadeTo('slow', 0.9)

  Tweets.fetch()

  $('.about .keywords').text(Tweets.search_attributes.q)