load_template "http://github.com/Jefers/rails-templates/raw/master/base.rb"

generate :nifty_scaffold, "Contact salutation_id:integer  first_name:string initials:string surname:string mobile:string home:string email:string address:string address_2:string address_3:string town:string county:string postal_code:string country_id:integer"

generate :nifty_scaffold, "Business name:string strap:string description:text street:string town:string open_times:string phone:string fax:string mobile:string website:string contact_id:integer email:string address:string address_2:string address_3:string city:string county:string postal_code:string country_id:integer"

generate :nifty_scaffold, "Listing name:string url:string phone:string address:string line2:string line3:string line4:string line5:string county:string post_code:string category:string cat2:string cat3:string cat4:string cat5:string cat6:string cat7:string cat8:string cat9:string cat10:string ca11:string cat12:string"

generate :model, "Mugshot parent_id:integer contact_id:integer content_type:string filename:string thumbnail:string size:integer width:integer height:integer"

name = ask("what do you want a user to be called?")
generate :nifty_authentication, name
rake "db:migrate"

git :add => ".",  :commit => "-m 'adding authentication'"

generate :controller, "welcome index"
route "map.root :controller => 'welcome'"
git :rm => "public/index.html"

git :add => ".", :commit => "-m 'adding welcome controller'"