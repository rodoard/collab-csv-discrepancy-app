module DiscrepancyDetectors
  class SubscriberCount
    def self.get_discrepancies(channel_matrix:, normalized_channel:, account_email_subscriber_count:)
      result = []
      existing_account_email_subscriber_count = channel_matrix[normalized_channel]
      unless existing_account_email_subscriber_count.nil?
        existing_email =  existing_account_email_subscriber_count.account_email
        new_email = account_email_subscriber_count.account_email
        existing_subscriber_count =  existing_account_email_subscriber_count.subscriber_count
        new_subscriber_count = account_email_subscriber_count.subscriber_count
        if (existing_email == new_email) &&
            (existing_subscriber_count != new_subscriber_count)
          result = [existing_email]
        end
      end
      result
    end
  end
  class ChannelOwnership
    def self.get_discrepancies(channel_matrix:, normalized_channel:, account_email_subscriber_count:)
      result = []
      existing_account_email_subscriber_count = channel_matrix[normalized_channel]
      unless existing_account_email_subscriber_count.nil?
        existing_email =  existing_account_email_subscriber_count.account_email
        new_email = account_email_subscriber_count.account_email
        if existing_email != new_email
          result = [existing_email, new_email]
        end
      end
      result
    end
  end
end
