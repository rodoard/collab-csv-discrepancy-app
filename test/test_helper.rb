ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"

def arrays_same? a1, a2
  a1.length == a2.length && !a1.difference(a2).any?
end

def get_uploaded_csv_file files
  files.map {|file| Rack::Test::UploadedFile.new(file_fixture(file))}
end
class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)
  self.file_fixture_path = 'test/fixtures/files'
end
