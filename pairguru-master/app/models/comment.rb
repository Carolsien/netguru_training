class Comment < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  validates :body, presence: true, length: {minimum: 3, maximum: 250 }
  validates :movie_id, uniqueness: { scope: :user_id, message: "You've commented this movie!" }

end
