



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