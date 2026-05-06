class Mission < ApplicationRecord
  belongs_to :agent

  validates :title, presence: true
  validates :status, presence: true, inclusion: { in: %w[assigned in_progress completed] }

  STATUSES = %w[assigned in_progress completed].freeze

  def status=(value)
    raise ArgumentError, "Invalid status" unless STATUSES.include?(value)
    super
  end
end
