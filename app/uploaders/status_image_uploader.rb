class StatusImageUploader < Shrine

  plugin :upload_options, store: ->(io, context) do
    {
      folder: "#{Rails.env}/store/brands/avatars/",
      tags: ["users", "brand", "statuses", "image for status", "user status", "brand status", "images"]
    }
  end

end
