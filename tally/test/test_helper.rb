require "minitest/autorun"
require "minitest/pride"

require "pry"

require 'fileutils'
class TallyTest < Minitest::Test

  def setup
    super
    FileUtils.mkdir_p('tmp/test')
  end

  def teardown
    super
    FileUtils.rm_r('tmp/test')
  end

  def temp_file_for(name, contents)
    File.new("tmp/test/#{name}", 'w').tap do |f|
      f.puts(contents)
      f.close
    end.path
  end
end

