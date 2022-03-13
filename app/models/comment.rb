class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates_presence_of :description
  default_scope { order('created_at DESC') }

  paginates_per 5
  # Override the as_json method in Comment to include the user
  def as_json(options = {})
    super(options.merge(include: :user))
  end
end
