class RecepiComment < ApplicationRecord
  belongs_to :recepi
  belongs_to :customer

  validates :comment, presence: true

  def comment_written_by?(current_customer)
    customer == current_customer || current_customer.admin?
  end

end
