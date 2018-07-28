module JSONAPI
  module RSpec
    module Id
      ::RSpec::Matchers.define :have_id do |expected|
        match { |actual| actual['id'] == expected.to_s }
      end
    end
  end
end
