class Post < ApplicationRecord
  belongs_to :user
  # dependent: :destroy means the comments related 
  # to the specific post in mention get deleted if the post does.
  has_many :comments, dependent: :destroy 

  has_rich_text :description
  validates_presence_of :title, :description
  validates_length_of :title, :minimum => 5, :maximum => 50

  default_scope { order('created_at DESC') }

  # Kaminari
  paginates_per 2
  
  # Override the as_json method in Post to include the post and comments' users:
  def as_json(options = {})
      super(options.merge(include: [:user, comments: {include: :user}]))
  end
end
