require "shrine"
require "cloudinary"
require "shrine/storage/cloudinary"
require "shrine/storage/file_system"
#require "shrine/storage/s3"

# require plugins
require 'shrine/plugins/activerecord'
require 'shrine/plugins/cached_attachment_data'
require 'shrine/plugins/restore_cached_data'
require 'shrine/plugins/instrumentation'
require 'shrine/plugins/validation'
require 'shrine/plugins/validation_helpers'
require 'shrine/plugins/determine_mime_type'
require 'shrine/plugins/backgrounding'
require 'shrine/plugins/upload_endpoint'
require 'shrine/plugins/keep_files'
require 'shrine/plugins/pretty_location'
require 'shrine/plugins/store_dimensions'
require 'shrine/plugins/derivatives'
require 'shrine/plugins/infer_extension'
require 'shrine/plugins/remote_url'

# Load plugins
Shrine.plugin :activerecord           # loads Active Record integration
Shrine.plugin :cached_attachment_data # enables retaining cached file across form redisplays
Shrine.plugin :restore_cached_data    # extracts metadata for assigned cached files
# WARNING: :instrumentation needs to be loaded before certain plugins (:derivatives, :determine_mime_type, :store_dimensions, etc)
Shrine.plugin :instrumentation, notifications: ActiveSupport::Notifications
Shrine.plugin :validation
Shrine.plugin :validation_helpers
Shrine.plugin :determine_mime_type, analyzer: :marcel, analyzer_options: { filename_fallback: true }
Shrine.plugin :backgrounding # load the plugin globally
Shrine.plugin :upload_endpoint
Shrine.plugin :keep_files
Shrine.plugin :pretty_location, class_underscore: :true
Shrine.plugin :store_dimensions, analyzer: :mini_magick
Shrine.plugin :derivatives          # eager processing
#Shrine.plugin :derivation_endpoint  # on-the-fly processing
Shrine.plugin :infer_extension
Shrine.plugin :remote_url, max_size: 20*1024*1024
Shrine.plugin :upload_options

# needed by `backgrounding` plugin
#require "./jobs/shrine_backgrounding/promote_job"
#require "./jobs/shrine_backgrounding/destroy_job"

###
#
# => Don't forget to include a 'staging' env check
#
###

if Rails.env.test?

  require "shrine/storage/memory"

  Shrine.storages = {
    cache: Shrine::Storage::Memory.new, # temporary
    store: Shrine::Storage::Memory.new  # permanent
  }

elsif Rails.env.production?

  Cloudinary.config(
    cloud_name: Rails.application.credentials.dig(:cloudinary, :cloud_name),
    api_key:    Rails.application.credentials.dig(:cloudinary, :api_key),
    api_secret: Rails.application.credentials.dig(:cloudinary, :api_secret)
  )

  Shrine.storages = {
    cache: Shrine::Storage::Cloudinary.new, # for direct uploads
    store: Shrine::Storage::Cloudinary.new
  }

  # s3_options = {
  #   bucket:            Rails.application.credentials.dig(:aws, :bucket), # required
  #   region:            Rails.application.credentials.dig(:aws, :region), # required
  #   access_key_id:     Rails.application.credentials.dig(:aws, :access_key_id),
  #   secret_access_key: Rails.application.credentials.dig(:aws, :secret_access_key),
  # }

  # Shrine.storages = {
  #   cache: Shrine::Storage::S3.new(prefix: "cache", **s3_options), # temporary
  #   store: Shrine::Storage::S3.new(**s3_options),                  # permanent
  # }


elsif Rails.env.staging?

  Cloudinary.config(
    cloud_name: Rails.application.credentials.dig(:cloudinary, :cloud_name),
    api_key:    Rails.application.credentials.dig(:cloudinary, :api_key),
    api_secret: Rails.application.credentials.dig(:cloudinary, :api_secret)
  )

  Shrine.storages = {
    cache: Shrine::Storage::Cloudinary.new, # for direct uploads
    store: Shrine::Storage::Cloudinary.new
  }

else

  Cloudinary.config(
    cloud_name: Rails.application.credentials.dig(:cloudinary, :cloud_name),
    api_key:    Rails.application.credentials.dig(:cloudinary, :api_key),
    api_secret: Rails.application.credentials.dig(:cloudinary, :api_secret)
  )

  Shrine.storages = {
    cache: Shrine::Storage::Cloudinary.new, # for direct uploads
    store: Shrine::Storage::Cloudinary.new
  }

  # s3_options = {
  #   bucket:            Rails.application.credentials.dig(:aws, :bucket), # required
  #   region:            Rails.application.credentials.dig(:aws, :region), # required
  #   access_key_id:     Rails.application.credentials.dig(:aws, :access_key_id),
  #   secret_access_key: Rails.application.credentials.dig(:aws, :secret_access_key),
  # }

  # Shrine.storages = {
  #   cache: Shrine::Storage::S3.new(prefix: "cache", **s3_options), # temporary
  #   store: Shrine::Storage::S3.new(**s3_options),                  # permanent
  # }

  # Shrine.storages = {
  #   cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"), # temporary
  #   store: Shrine::Storage::FileSystem.new("public", prefix: "uploads"),       # permanent
  # }
end

# Allows you to specify default URL options for uploaded files.
#Shrine.plugin :default_url_options, cache: url_options, store: url_options


# Setup background jobs (sidekiq workers) for async uploads.
# app/jobs/shrine_backgrounding/promote_job.rb
#Shrine::Attacher.promote { |data| ShrineBackgrounding::PromoteJob.perform_async(data) }
# app/jobs/shrine_backgrounding/delete_job.rb
#Shrine::Attacher.delete { |data| ShrineBackgrounding::DeleteJob.perform_async(data) }


