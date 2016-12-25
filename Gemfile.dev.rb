# https://github.com/ManageIQ/guides/blob/master/developer_setup/classic_ui_split.md
# This file gets evaluated both directly from manageiq directory, and from manageiq-ui-classic directory
# via manageiq-ui-classic/spec symlink, which may cause funny errors.
gem "manageiq-ui-classic", :path => File.realpath("../manageiq-ui-classic", __dir__)
#gem "manageiq-ui-classic", :path => "../manageiq-ui-classic"

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
