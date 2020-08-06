class ProductImageUploader < Shrine
  plugin :validation_helpers
  plugin :determine_mime_type

  Attacher.validate do
    validate_max_size 10*1024*1024
    validate_mime_type %w[image/jpeg image/png image/webp]
  end

  plugin :upload_options, store: ->(io, context) do
    {
      folder: "#{Rails.env}/store/products",
      tags: ["brands", "companies", "entrepreneurs"]
    }
  end

end
