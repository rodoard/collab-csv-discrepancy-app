# frozen_string_literal: true

class DiscrepancyData
  include ActiveModel::Validations
  include AutoInitializable
  attr_reader :account_email, :youtube_channel, :subscriber_count

  validates :account_email, :youtube_channel, :subscriber_count, presence: true
  validate :subscriber_count_is_number

  def subscriber_count_is_number
    unless (subscriber_count.is_a?(Integer) and subscriber_count >= 0)
      errors.add(:subscriber_count, "must be integer")
    end
  end
end
