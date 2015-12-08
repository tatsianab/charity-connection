OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '376595890152-prl6u9m5v754nd948n56gdp52qd3guvs.apps.googleusercontent.com', 'H9XfVik6fMCORH-1-HFZ8OZ3', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end
