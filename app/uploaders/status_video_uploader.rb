class StatusVideoUploader < Shrine

  plugin :upload_options, store: ->(io, context) do
    {
      folder: "#{Rails.env}/store/brands/avatars/",
      tags: ["users", "brand", "statuses", "user status", "brand status"]
    }
  end

end
