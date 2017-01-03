# https://github.com/ManageIQ/guides/blob/master/developer_setup/classic_ui_split.md

# Per https://github.com/manageiq/guides/blob/master/developer_setup/classic_ui_split.md
unless dependencies.detect { |d| d.name == "manageiq-ui-classic" }
  gem "manageiq-ui-classic", :path => File.realpath("../manageiq-ui-classic", __dir__)
end

gem "pry"
gem "pry-doc"
gem "pry-rails"
gem "pry-remote"
gem "pry-byebug"
gem "byebug"
gem "rb-readline"  # for irb
#gem "rubocop"
gem "rubocop-git"
gem "haml-lint"
gem "launchy"  # TODO: https://stackoverflow.com/questions/35383550/how-to-automatically-launch-browser-when-rails-server-starts
