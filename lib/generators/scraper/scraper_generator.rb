class ScraperGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)


  argument :brand_name, type: :string, required: true, desc: "Exact representation of the Brand/Company name"
  argument :brand_identifier, type: :string, required: true, desc: "Use domain name"
  argument :brand_model_name, type: :string, required: true, desc: "Brand/Company representation for model name (Ruby class)"
  argument :brand_table_name
  argument :brand_url, type: :string, required: true, desc: "Provide base URL only"

  class_option :doc, type: :boolean, default: false, desc: "Include documentation."

  def create_migration_and_model
    current_timestamp = Time.now.strftime("%Y%m%d%H%M%S") # Time format: YYYY MM DD HH MM SS (no spaces)

    # BuiltLinks and Products migrations
    template "migrations.template", "db/scraper/migrate/#{current_timestamp}_create_#{brand_identifier}_built_links.rb"

    # Models for BuiltLink and ScraperProduct
    template "built_links_models.template", "app/models/scraper_db/scraper_#{brand_identifier}.rb"
    template "products_models.template", "app/models/scraper_db/scraper_#{brand_identifier}.rb"
  end

  def create_brands_template
    template "brands.template", "db/seeds/scrapers/brands/#{brand_identifier}.rb"
  end

  def create_files_directory
    empty_directory "db/seeds/scrapers/files/#{brand_identifier}"
    empty_directory "db/seeds/scrapers/files/#{brand_identifier}/logo"
  end

  def create_links_template
    template "links.template", "db/seeds/scrapers/links/#{brand_identifier}.rb"
  end

  def create_products_template
    template "products.template", "db/seeds/scrapers/products/#{brand_identifier}.rb"
  end
end
