class DiscrepancyDetector
  attr_reader :discrepancies
  CONCERNS = [
    :channel_ownership,
    :subscriber_count
  ]
  def initialize models
    @discrepancy_models = models
  end

  def detect concern: nil
    set_detectors concern
    channel_matrix = {}
    @discrepancies = []
    @discrepancy_models.each do |discrepancy_model|
      normalized_channel = YoutubeChannelNormalizer.normalize(discrepancy_model.youtube_channel)
      account_email_subscriber_count = AccountEmailSubscriberCount.new(account_email: discrepancy_model.account_email , subscriber_count: discrepancy_model.subscriber_count)
      @detectors.each do |detector|
        @discrepancies.push *detector.get_discrepancies(
          channel_matrix: channel_matrix,
          normalized_channel: normalized_channel,
          account_email_subscriber_count: account_email_subscriber_count
        )
      end
      channel_matrix[normalized_channel] =account_email_subscriber_count
    end
    @discrepancies.uniq!
    self
  end
  private
  DETECTORS = {
    channel_ownership: DiscrepancyDetectors::ChannelOwnership,
    subscriber_count: DiscrepancyDetectors::SubscriberCount
  }
  def set_detectors concern
    @detectors = case concern.to_sym
    when :channel_ownership
      DETECTORS.values_at(:channel_ownership)
    when :subscriber_count
      DETECTORS.values_at(:subscriber_count)
    else
      DETECTORS.values
    end
  end
  class YoutubeChannelNormalizer
    def self.normalize channel
      channel.sub(/(^.*UC)|(.*\/channel\/)/,'')
    end
  end
  class AccountEmailSubscriberCount
    include AutoInitializable
    attr_reader :account_email, :subscriber_count
  end
end
