require 'vcr'
require 'webmock/rspec'
module VCRSetup
  VCR.configure do |c|
    c.cassette_library_dir = 'spec/cassettes'
    c.hook_into :webmock
  end
end
