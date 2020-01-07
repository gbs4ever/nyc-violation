# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
<<<<<<< HEAD
  origins 'nyc-violation.netlify.com/'
=======
    origins 'nyc-violation.netlify.com'
>>>>>>> 80aef923b3046bc31e39c0a5728f04ab60668998

     resource '*',
      
       headers: :any,
       methods: [:get, :post, :put, :patch, :delete, :options, :head],
       credentials: true
   end
 end
