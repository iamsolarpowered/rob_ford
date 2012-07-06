class HomeController < ApplicationController

  def index
    # @tweets = Twitter.search('@tomayorford -RT', :rrp => 20, :result_type => 'recent').results
  end
end
