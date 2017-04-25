class Poll < ApplicationRecord
  belongs_to :user
  has_many :options, inverse_of: :poll

  accepts_nested_attributes_for :options
end
