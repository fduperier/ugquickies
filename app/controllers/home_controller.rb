class HomeController < ApplicationController

  def index
    @past_quickies = Quickie.past_ordered
    @future_quickies = Quickie.future_ordered
    
    @past_top3 = Quickie.top_past
    @future_top3 = Quickie.top_future
  end

end
