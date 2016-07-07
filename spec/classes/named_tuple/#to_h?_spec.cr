require "../../spec_helper"
require "../../../src/named_tuple/#to_h?"

module CrystalPlusNamedTupleFeature
  module InstanceMethods
    module ToH_p
      def self.to_h?(**options)
        options.to_h?
      end

      it name do
        to_h?.should be_nil
      end
    end
  end
end
