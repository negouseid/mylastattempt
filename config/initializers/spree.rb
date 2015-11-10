# Configure Solidus Preferences
# See http://docs.solidus.io/Spree/AppConfiguration.html for details

Spree.config do |config|

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




