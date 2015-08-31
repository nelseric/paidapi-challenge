require "rspec"

spec_dir = File.dirname(__FILE__)
$LOAD_PATH << spec_dir
lib_dir = File.join spec_dir, "..", "lib"
$LOAD_PATH << lib_dir

RSpec.configure do |config|

end
