require 'dragonfly'

bucket_name = "collegeLens"
access_key = "AKIAJWE527SPHAHZBQ7Q"
secret_key = "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"



###################################
# => LOCAL STORAGE
###################################


app = Dragonfly[:images]
app.configure_with(:imagemagick)
app.configure_with(:rails)



###################################
# => AWS
###################################
if Rails.env.production?
  app.configure do |c|
    c.datastore = Dragonfly::DataStorage::S3DataStore.new(
      :bucket_name => bucket_name,
      :access_key_id => access_key,
      :secret_access_key => secret_key
    )
  end
end


app.define_macro(ActiveRecord::Base, :image_accessor)