require "../../spec_helper"
require "../../../src/dir/.tmp"
require "file_utils"

module CrystalPlusDirFeature
  module ClassMethods
    module Tmp
      describe name do
        it "default" do
          tmpdir = Dir.tmp do |tmpdir|
            tmpdir.starts_with?("/tmp/").should be_true
            Dir.exists?(tmpdir).should be_true
            tmpdir
          end
          Dir.exists?(tmpdir).should be_false
        end

        it "cleanup: false" do
          tmpdir = Dir.tmp(cleanup: false) do |tmpdir|
            tmpdir.starts_with?("/tmp/").should be_true
            Dir.exists?(tmpdir).should be_true
            tmpdir
          end
          Dir.exists?(tmpdir).should be_true
          FileUtils.rm_r tmpdir if Dir.exists?(tmpdir)
        end

        it "base" do
          base_dir = File.join(__DIR__, "/.tmp")
          tmpdir = Dir.tmp(base: base_dir) do |tmpdir|
            tmpdir.starts_with?(base_dir).should be_true
          end
        end
      end
    end
  end
end
