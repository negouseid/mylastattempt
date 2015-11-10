# Configure Solidus Preferences
# See http://docs.solidus.io/Spree/AppConfiguration.html for details

Spree.config do |config|
  # Without this preferences are loaded and persisted to the database. This
  # changes them to be stored in memory.
  # This will be the default in a future version.
  config.use_static_preferences!

  # Core:

  # Default currency for new sites
  config.currency = "USD"

  # from address for transactional emails
  config.mails_from = "store@example.com"

  # Uncomment to stop tracking inventory levels in the application
  # config.track_inventory_levels = false

  # When true, product caches are only invalidated when they come in or out of
  # stock. Default is to invalidate cache on any inventory changes.
  # config.binary_inventory_cache = true


  # Frontend:

  # Custom logo for the frontend
  # config.logo = "logo/solidus_logo.png"

  # Template to use when rendering layout
  # config.layout = "spree/layouts/spree_application"


  # Admin:

  # Custom logo for the admin
  # config.admin_interface_logo = "logo/solidus_logo.png"

  # Gateway credentials can be configured statically here and referenced from
  # the admin. They can also be fully configured from the admin.
  #
  # config.static_model_preferences.add(
  #   Spree::Gateway::StripeGateway,
  #   'stripe_env_credentials',
  #   secret_key: ENV['STRIPE_SECRET_KEY'],
  #   publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
  #   server: Rails.env.production? ? 'production' : 'test',
  #   test: !Rails.env.production?
  # )
   attachment_config = {

   s3_credentials: {
     access_key_id:     ENV['AWS_ACCESS_KEY_ID'],
     secret_access_key: ENV['AWS_SECRET_KEY_ID'],
     bucket:            ENV['S3_BUCKET']
   },

   storage:        :s3,
   s3_headers:     { "Cache-Control" => "max-age=31557600" },
   s3_protocol:    "https",
   bucket:         ENV['S3_BUCKET_NAME'],
   url:            "https://console.aws.amazon.com/s3/home?region=us-west-2&bucket=mikesmovies&prefix=",

   styles: {
       mini:     "48x48>",
       small:    "100x100>",
       product:  "240x240>",
       large:    "600x600>"
   },

   path:           "/:class/:id/:style/:basename.:extension",
   default_url:    "/:class/:id/:style/:basename.:extension",
   default_style:  "product"
 }

 attachment_config.each do |key, value|
   Spree::Image.attachment_definitions[:attachment][key.to_sym] = value
 end
end

Spree.user_class = "Spree::LegacyUser"




