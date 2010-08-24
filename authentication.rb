if yes?("Do you want to use Devise?")
 
generate "devise User"
generate "devise:views"
generate :nifty_scaffold, "Role name:string"
generate :migration "create_roles_user_table role_id:integer user_id:integer"

file "config/environments/development.rb", <<-DEV
config.cache_classes = false
config.whiny_nils = true
config.action_controller.consider_all_requests_local = true
config.action_view.debug_rjs                         = true
config.action_controller.perform_caching             = false
config.action_mailer.raise_delivery_errors = false
config.action_mailer.default_url_options = { :host => 'localhost:3010' }

DEV

else
name = ask("what do you want a user to be called?")
generate :nifty_authentication, name
end
