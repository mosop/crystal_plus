require "../crystal_plus/c/lib/mkdtemp"
require "file_utils"

class Dir
  def self.tmp(base = "/tmp", cleanup = true)
    base = File.expand_path(base)
    p = "#{base}/XXXXXX".bytes + [0_u8]
    raise "mkdtemp() error." if CrystalPlus::C::Lib.mkdtemp(p) == 0
    dir = String.new(p.to_unsafe)
    begin
      yield dir
    ensure
      FileUtils.rm_r dir if cleanup && Dir.exists?(dir)
    end
  end
end
