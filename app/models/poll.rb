class Poll < ApplicationRecord
  belongs_to :user
  has_many :options, inverse_of: :poll
  has_many :responses

  accepts_nested_attributes_for :options

  before_validation :assign_short_id_and_upvote, :on => :create

  def assign_short_id_and_upvote
    self.short_id = ShortId.new(self.class).generate
  end
end
