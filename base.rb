rake 'db:create'
generate :nifty_layout

generate :nifty_scaffold, "Page name:string permalink:string content:text"

generate :nifty_scaffold, "Contact salutation_id:integer  first_name:string initials:string surname:string mobile:string home:string email:string address:string address_2:string address_3:string town:string county:string postal_code:string country_id:integer"

generate :nifty_scaffold, "Business name:string strap:string description:text street:string town:string open_times:string phone:string fax:string mobile:string website:string contact_id:integer email:string address:string address_2:string address_3:string city:string county:string postal_code:string country_id:integer"

generate :nifty_scaffold, "Category name:string description:text"

generate :nifty_scaffold, "Listing name:string url:string phone:string address:string line2:string line3:string line4:string line5:string county:string post_code:string"

generate :model, "CategoryListing listing_id:integer category_id:integer"

generate :model, "Mugshot parent_id:integer contact_id:integer content_type:string filename:string thumbnail:string size:integer width:integer height:integer"

route "map.root :controller => 'listing'"

load_template "http://github.com/Jefers/rails-templates/raw/master/authentication.rb"

rake 'db:migrate'

run "echo TODO > README"

gem 'mislav-will_paginate', :lib => 'will_paginate', :source => 'http://gems.github.com'
gem 'fancy-buttons', :version => '>=0.5.3'
gem 'compass', :version => '>= 0.10.1'
gem 'haml', :version => '>=3.0.4'
gem 'searchlogic', :version => '>=2.4.19'
gem 'formtastic', :version => '>=0.9.8'
gem 'repeated_auto_complete'
gem 'warden', :version=> '=0.10.7'
gem 'devise', :version=> '=1.0.8'
gem 'RedCloth', :source => 'http://github.com/jgarber/redcloth.git'
gem 'cancan', :version => '>=1.3.2'
gem 'barby', :lib => 'barby', :version => '>= 0.3.2', :source => 'http://github.com/toretore/barby.git'
gem 'rqrcode'


rake('gems:install', :sudo => true)
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

run "./script/generate formtastic"

run "touch config.rb"

 file "config.rb", <<-CONF
require 'compass-colors'
require 'fancy-buttons'
# Require any additional compass plugins here.

# Set this to the root of your project when deployed:
http_path = "/"
css_dir = "public/stylesheets/compiled"
sass_dir = "src"
images_dir = "public/images"
javascripts_dir = "public/javascripts"
# To enable relative paths to assets via compass helper functions. Uncomment:
relative_assets = true
#http_images_path = "public/images"
http_images_dir = "src/images"
CONF

run "touch tmp/.gitignore log/.gitignore vendor/.gitignore"
run "cp config/database.yml config/example_database.yml"

git :init

file ".gitignore", <<-IGNORE
.DS_Store
log/*.log
tmp/**/*
config/database.yml
db/*.sqlite3
.sass-cache/*
public/images/barcodes/*
public/assets/listings/*
IGNORE

git :add => "."
git :commit => "-a -m 'Initial commit'"
