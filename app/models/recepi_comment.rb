class RecepiComment < ApplicationRecord
  belongs_to :recepi
  belongs_to :customer

  validates :comment, presence: true
end
