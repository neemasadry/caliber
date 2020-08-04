class BrandAvatarUploader < Shrine

  plugin :upload_options, store: ->(io, context) do
    {
      folder: "#{Rails.env}/store/brands/avatars/",
      tags: ["brands", "companies", "entrepreneurs"]
    }
  end

end