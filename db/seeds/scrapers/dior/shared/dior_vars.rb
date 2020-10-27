# Set constants and variables for: Dior

BRAND_DOMAIN      = "https://www.dior.com"
BRAND_DOMAIN_I18N = "https://www.dior.com/en_us"
BRAND_IDENTIFIER  = "dior"
BRAND_NAME        = "Dior"

BRAND_DIR_PATH    = Rails.root.join('db', 'seeds', 'scrapers', BRAND_IDENTIFIER)
FILES_PATH        = Rails.root.join(BRAND_DIR_PATH, 'files')
AVATAR_PATH       = Rails.root.join(FILES_PATH, 'avatars')
LOGO_PATH         = Rails.root.join(FILES_PATH, 'logos')
CSV_PATH          = Rails.root.join(FILES_PATH, 'csvs')

current_timestamp = Time.now.strftime("%Y%m%d%H%M%S") # Time format: YYYY mm dd HH MM SS (no spaces)

if Brand.exists?(brand_identifier: BRAND_IDENTIFIER)
  BRAND_OBJECT            = Brand.find_by(brand_identifier: BRAND_IDENTIFIER)
  BRAND_REFERENCE         = BRAND_OBJECT.id
  SCRAPER_BRAND_OBJECT    = ScraperBrand.find_by(brand_identifier: BRAND_IDENTIFIER)
  SCRAPER_BRAND_REFERENCE = SCRAPER_BRAND_OBJECT.id
end
