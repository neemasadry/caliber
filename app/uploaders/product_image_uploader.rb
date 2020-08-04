class ProductImageUploader < Shrine

  plugin :upload_options, store: ->(io, context) do
    {
      folder: "#{Rails.env}/store/products",
      tags: ["brands", "companies", "entrepreneurs"]
    }
  end

end
