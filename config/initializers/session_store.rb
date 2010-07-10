# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_webroutes_session',
  :secret      => '8bb89ca81e1638931dd2173a36c576b32d37c908cd82161fd156becc5d4db34a09b4d8f016ced19f22d47eb5807b92531e23a4694da5fc9fbea63de38b0569f9'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
