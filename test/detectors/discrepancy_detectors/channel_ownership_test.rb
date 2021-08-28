# frozen_string_literal: true

require 'test_helper'

class  ChannelOwnershipTest < ActiveSupport::TestCase
  test "detects channel ownership discrepancies" do
    channel_matrix = {
      "5OXObSqKlu01WtG0GTUq2g":
      DiscrepancyDetector::AccountEmailSubscriberCount.new(
        account_email: "test_1@gmail.com",
        subscriber_count: 10
      ),
      "WBKJ1RNeKTPII34pc6UyUg":
      DiscrepancyDetector::AccountEmailSubscriberCount.new(
        account_email: "test_3@gmail.com",
        subscriber_count: 2365
      )
    }.with_indifferent_access
    normalized_channel = "5OXObSqKlu01WtG0GTUq2g"
    account_email_subscriber_count = DiscrepancyDetector::AccountEmailSubscriberCount.new(
      account_email: "test_2@gmail.com",
      subscriber_count: 28443
    )
    discrepancies = DiscrepancyDetectors::ChannelOwnership
    .get_discrepancies(channel_matrix: channel_matrix,
                       normalized_channel: normalized_channel,
                       account_email_subscriber_count: account_email_subscriber_count)
    expected = ["test_1@gmail.com",  "test_2@gmail.com"]
    assert arrays_same?(expected, discrepancies)
  end
end
