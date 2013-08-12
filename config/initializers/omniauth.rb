Rails.application.config.middleware.use OmniAuth::Builder do
  # ...
  provider :identity, on_failed_registration: new_server_path

end