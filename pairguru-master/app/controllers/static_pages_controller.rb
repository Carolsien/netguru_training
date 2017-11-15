class StaticPagesController < ApplicationController
  def topcommenters
    @grouped_commenters = Comment.where('created_at >= ?', 1.week.ago).group(:user_id)
    @how_many_commenters = @grouped_commenters.count
    @top10 = @how_many_commenters.sort_by{|_key, value| value}.reverse.take(10)
  end
end
