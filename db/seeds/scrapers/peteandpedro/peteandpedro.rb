module PeteAndPedro
  extend ActiveSupport::Concern

  included do
    # peteandpedro_brand
    AVATAR_PATH = "db/seeds/scrapers/peteandpedro/files/avatars/"
    LOGO_PATH = "db/seeds/scrapers/peteandpedro/files/logos/"

    # peteandpedro_links
    BRAND_DOMAIN             = "https://peteandpedro.com"
    BRAND_IDENTIFIER         = "peteandpedro"
    BRAND_NAME               = "Pete & Pedro"
    BRAND_OBJECT             = Brand.find_by(brand_identifier: BRAND_IDENTIFIER)
    BRAND_REFERENCE          = BRAND_OBJECT.id
    COLLECTIONS              = "/collections/"
    SCRAPER_BRAND_OBJECT     = ScraperBrand.find_by(brand_identifier: BRAND_IDENTIFIER)
    SCRAPER_BRAND_REFERENCE  = SCRAPER_BRAND_OBJECT.id

    # peteandpedro_products
    # BRAND_IDENTIFIER        = "peteandpedro"
    # BRAND_NAME              = "Pete & Pedro"
    # BRAND_OBJECT            = Brand.find_by(brand_identifier: BRAND_IDENTIFIER)
    # BRAND_REFERENCE         = BRAND_OBJECT.id
    # SCRAPER_BRAND_OBJECT    = ScraperBrand.find_by(brand_identifier: BRAND_IDENTIFIER)
    # SCRAPER_BRAND_REFERENCE = SCRAPER_BRAND_OBJECT.id
    FILES_PATH                = Rails.root.join('db', 'seeds', 'scrapers') # Pathname("../files/#{BRAND_NAME}")
  end

end
