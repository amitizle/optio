lib_dir = File.expand_path(File.join(__dir__, 'optio'))
Dir.glob(File.join(lib_dir, '**', '*')).each do |f|
  require f if File.file?(f)
end

module Optio
  # Your code goes here...
end
