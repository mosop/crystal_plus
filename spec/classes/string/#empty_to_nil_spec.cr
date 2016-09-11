require "../../spec_helper"
require "../../../src/string/#empty_to_nil"

module CrystalPlusNamedTupleFeature
  module InstanceMethods
    module EmptyToNil
      it name do
        "".empty_to_nil.should be_nil
        s = "abc"
        s.empty_to_nil.should be s
      end
    end
  end
end
