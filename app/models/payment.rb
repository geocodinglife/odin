class Payment < ApplicationRecord
  belongs_to :room
  belongs_to :user
  belongs_to :lead
end
