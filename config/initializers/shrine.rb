require 'cloudinary'
require 'shrine/storage/cloudinary'

## robado con orgullo de https://www.youtube.com/watch?v=TQzsIJrxftY

Cloudinary.config(
  cloud_name: "dptfljk5a",
  api_key: "189683783713417",
  api_secret: "Tqx79AKLyYn_sb0nOowIbA5svUs"
)

Shrine.storages = {
  cache: Shrine::Storage::Cloudinary.new(prefix: "tienda/cache"), # for direct uploads
  store: Shrine::Storage::Cloudinary.new(prefix: "tienda"),
}

Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data # for forms
Shrine.plugin :restore_cached_data # re-extract metadata when attaching a cached file
Shrine.plugin :validation_helpers
Shrine.plugin :validation

