module JSONAPI
  module RSpec
    module Included
      ::RSpec::Matchers.define :have_included do |val|
        match do |actual|
          return false unless actual['included']

          !val || actual['included'].any? do |data|
            val.keys.all? { |key| data.key?(key.to_s) && val[key] == data[key.to_s] }
          end
        end

        failure_message do |actual|
          if !actual['included']
            "expected #{actual} to have included"
          else
            "expected #{actual['included']} to have included #{val}"
          end
        end
      end
    end
  end
end
