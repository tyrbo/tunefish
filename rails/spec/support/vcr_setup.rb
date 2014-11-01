require 'vcr'
require 'webmock/rspec'
module VCRSetup
  VCR.configure do |c|
    c.cassette_library_dir = 'spec/cassettes'
    c.hook_into :webmock
    c.before_record do |i|
      i.response.body.force_encoding('UTF-8')
    end
  end
end
