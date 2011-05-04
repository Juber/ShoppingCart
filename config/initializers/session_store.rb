# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_restful_session',
  :secret      => '46a38e26d6dd6e75a3069bc6c7b55f9efabe5e51db2932af0e6ef6a6ba365e4b8d13d07cefae58314fbd9a8100ec66e2298993088c5beffec341952138ee5d8c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
