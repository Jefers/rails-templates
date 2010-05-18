run "echo TODO > README"

generate :nifty_layout

gem 'mislav-will_paginate', :lib => 'will_paginate', :source => 'http://gems.github.com'
rake "gems:install"
rake "gems:unpack:dependencies"
 
if yes?("Do you want to use attachment_fu?")
  plugin "attachment_fu", :git => "git://github.com/technoweenie/attachment_fu.git"
end
 
 
if yes?("Do you want to use Paperclip?")
  plugin "paperclip", :git => "git://github.com/thoughtbot/paperclip.git"
end
  
if yes?("Do you want to use tagging?")
  plugin "acts-as-taggable-on", :git => "git://github.com/mbleigh/acts-as-taggable-on.git"
end
 
if yes?("Do you want to use RSpec?")
  plugin "rspec", :git => "git://github.com/dchelimsky/rpec.git"
  plugin "rspec-rails", :git => "git://github.com/dchelimsky/rspec.rails.git"
  generate :rspec
end

git :init

file ".gitignore", <<-END
.DS_Store
log/*.log
tmp/**/*
config/database.yml
db/*.sqlite3
END

run "touch tmp/.gitignore log/.gitignore vendor/.gitignore"
run "cp config/database.yml config/example_database.yml"

git :add => ".", :commit => "-m 'initial commit'"