# frozen_string_literal: true

require 'test_helper'

EXPECTED = "XPBsjgKKG2HqsKBhWA4uQw"
YOUTUBE_CHANNEL_VARIATIONS = [
  "https://www.youtube.com/channel/UCXPBsjgKKG2HqsKBhWA4uQw",
  "youtube.com/channel/UCXPBsjgKKG2HqsKBhWA4uQw",
  "youtube.com/channel/XPBsjgKKG2HqsKBhWA4uQw",
  "UCXPBsjgKKG2HqsKBhWA4uQw",
  EXPECTED
]

class  DiscrepancyDetectorTest < ActiveSupport::TestCase
  test "normalizes all four youtube channel variations" do
    YOUTUBE_CHANNEL_VARIATIONS.each do |variation|
      actual = DiscrepancyDetector::YoutubeChannelNormalizer.normalize(variation)
      assert_includes([EXPECTED], actual)
    end
  end
end
