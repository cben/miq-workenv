# Silence messages
def my_override_gem(name, *args)
  if dependencies.any?
    raise "Trying to override unknown gem #{name}" unless (dependency = dependencies.find { |d| d.name == name })
    dependencies.delete(dependency)

    # calling_file = caller_locations.detect { |loc| !loc.path.include?("lib/bundler") }.path
    gem(name, *args).tap do
      # Bundler::UI::Shell.new.warn "** override_gem: #{name}, #{args.inspect}, caller: #{calling_file}" unless ENV["RAILS_ENV"] == "production"
    end
  end
end


# See https://github.com/manageiq/guides/blob/master/developer_setup/plugins.md
dir = __dir__
dir = File.dirname(dir) if File.basename(dir) == 'bundler.d'
Dir["#{dir}/plugins/*"].each do |plugin_dir|
  plugin_dir = File.realpath(plugin_dir)
  gem_name = File.basename(plugin_dir)
  if defined?(override_gem)
    puts "my_override_gem #{gem_name}, :path => #{plugin_dir}" if ENV['DEBUG']
    begin
      my_override_gem gem_name, :path => plugin_dir
    rescue => e
      # A plugin with spec/manageiq pointing to core with >1 plugins may trip up here.
      # Assume plugins/* are all legit, and just skip.
      # TODO cleaner solution in override_gem?
      raise unless e.message =~ /Trying to override unknown gem/
    end
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
gem "rb-readline"  # for irb
gem "pry-rails"
gem "pry-remote"
gem "pry-byebug"
gem "byebug"
#gem "rubocop"
gem "rubocop-git", require: false
gem "haml-lint", require: false
gem "launchy"  # TODO: https://stackoverflow.com/questions/35383550/how-to-automatically-launch-browser-when-rails-server-starts

gem "listen"

# performance & mem
gem "manageiq-performance", :git => "https://github.com/ManageIQ/manageiq-performance.git"
gem "stackprof", require: false
gem "derailed", require: false

#gem "kubeclient", path: "/home/bpaskinc/kubeclient"
#override_gem 'kubeclient', :path => '/home/bpaskinc/kubeclient'
