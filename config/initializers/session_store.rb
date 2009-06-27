# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_twilio_session',
  :secret      => 'dd06a3aec28ba6b7a1cb6f89037318df9332759eff386aead01e77ddb45e5ef6991aad91f1a14a8832fe4481fc6caac132961788ee160d98907096f818438fd5'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
