# See https://github.com/manageiq/guides/blob/master/developer_setup/plugins.md
Dir["#{File.realpath(__dir__)}/plugins/*"].each do |plugin_dir|
  gem_name = File.basename(plugin_dir)
  if defined?(override_gem)
    puts "override_gem #{gem_name}, :path => #{plugin_dir}" if ENV['DEBUG']
    override_gem gem_name, :path => plugin_dir
  else
    # assume old, evaluated at start of Gemfile
    unless dependencies.detect { |d| d.name == gem_name }
      puts "gem #{gem_name}, :path => #{plugin_dir}" if ENV['DEBUG']
      gem gem_name, :path => plugin_dir
    end
  end
end

gem "pry"
gem "pry-doc", require: false
gem "pry-rails"
gem "pry-remote"
gem "pry-byebug"
gem "byebug"
gem "rb-readline"  # for irb
#gem "rubocop"
gem "rubocop-git", require: false
gem "haml-lint", require: false
gem "launchy"  # TODO: https://stackoverflow.com/questions/35383550/how-to-automatically-launch-browser-when-rails-server-starts

# performance & mem
gem "manageiq-performance", :git => "https://github.com/ManageIQ/manageiq-performance.git"
gem "stackprof", require: false
gem "derailed", require: false

