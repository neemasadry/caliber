class AvatarImageUploader < Shrine

  plugin :upload_options, store: ->(io, context) do
    {
      folder: "#{Rails.env}/store/users/avatars/",
      tags: ["users", "avatars", "profile picture", "profile image"]
    }
  end

  # Define sizes for avatars
  THUMBNAILS = {
    large:      [800, 800],
    medium:     [600, 600],
    small:      [300, 300],
    nav_small:  [40, 40],
    nav_xsmall: [32, 32]
  }

  # Validations
  Attacher.validate do
    validate_max_size 2.megabyte, message: "is too large (max is 3 MB)"
    validate_mime_type %w[image/jpeg image/png]
    validate_extension %w[jpg jpeg png]
    #validate_mime_type_inclusion ['image/jpg', 'image/jpeg', 'image/png']
  end

  # Generate different sizes (see THUMBNAILS)
  Attacher.derivatives do |original|
    vips = ImageProcessing::Vips.source(original)

    THUMBNAILS.transform_values do |(width, height)|
      vips.resize_to_limit!(width, height)
    end
  end

  # process(:store) do |io, context|
  #   { original: io, thumb: resize_to_limit!(io.download, 300, 300) }
  # end

end
