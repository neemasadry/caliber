class StatusVideoUploader < Shrine

  plugin :upload_options, store: ->(io, context) do
    {
      folder: "#{Rails.env}/store/users/statuses/videos",
      tags: ["users", "brand", "statuses", "video for status", "user status", "brand status", "videos"]
    }
  end

end
