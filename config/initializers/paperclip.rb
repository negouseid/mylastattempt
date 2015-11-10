Paperclip::Attachment.default_options[:url] = 'https://console.aws.amazon.com/s3/home?region=us-west-2&bucket=mikesmovies&prefix='
Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'
Paperclip::Attachment.default_options[:s3_host_name] = 's3-us-west-2.amazonaws.com'
