class RedFlagRecord < ApplicationRecord
  belongs_to :user

  enum status: { under_investigation: 0, rejected: 1, resolved: 2 }, _default: "under_investigation"

  validates :status, inclusion: { in: %w[under_investigation rejected resolved] }, on: :update, unless: :admin?

  private

  def admin?
    user.admin?
  end
  
end
