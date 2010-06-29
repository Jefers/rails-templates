if yes?("Do you want to use Devise?")
 
generate "devise User"

file "config/environments/development.rb", <<-END

config.action_mailer.default_url_options = { :host => 'localhost:3010' }

END

else
name = ask("what do you want a user to be called?")
generate :nifty_authentication, name
end
