require "../../spec_helper"
require "../../../src/named_tuple/#merge"

module CrystalPlusNamedTupleFeature
  module InstanceMethods
    module Merge
      def self.merge(tuple, **options)
        tuple.merge(options)
      end

      def self.reverse_merge(tuple, **options)
        options.merge(tuple)
      end

      it name do
        smile = {face: ":)"}
        frown = {face: ":("}
        other = {other: ":P"}
        merge(smile).should eq smile
        merge(smile, **frown).should eq frown
        expect_raises(ArgumentError) { merge(smile, **other) }
        expect_raises(ArgumentError) { reverse_merge(smile) }
        reverse_merge(smile, **frown).should eq smile
        expect_raises(ArgumentError) { merge(smile, **other) }
      end
    end
  end
end
