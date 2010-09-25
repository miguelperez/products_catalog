# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_product_catalog_session',
  :secret      => '4399140f088c835e075694d9407b287f2bcc6823444f35ffe9bf0ec4848acd8ed134e3de78cac875e1d01739b1d7ee9b8c95b7e9784cdc56959d002a79405e3f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
