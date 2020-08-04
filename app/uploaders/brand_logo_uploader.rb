class BrandLogoUploader < Shrine

  plugin :upload_options, store: ->(io, context) do
    {
      folder: "#{Rails.env}/store/brands/logos/",
      tags: ["brands", "companies", "entrepreneurs"]
    }
  end

end
