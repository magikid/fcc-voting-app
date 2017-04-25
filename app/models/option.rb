class Option < ApplicationRecord
  belongs_to :poll, inverse_of: :options
end
