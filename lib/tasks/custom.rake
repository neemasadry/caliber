# lib/tasks/custom_seed.rake
namespace :db do
  namespace :seed do

    ### BEGIN DROP, CREATE, MIGRATE DATABASE ###
    desc "Seed all User entries in db/seed_partials/users.rb"
    task :reset_dcm => :environment do

      # Purge ActiveStorage tables and all files stored in subdirectories under storage/
      ActiveStorage::Attachment.all.each do |attachment|
        attachment.purge
      end

      Rake::Task["db:drop"].invoke
      Rake::Task["db:create"].invoke
      Rake::Task["db:migrate"].invoke
    end
    ### END DROP, CREATE, MIGRATE DATABASE ###

    ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###
    ### ### ### ### ### ### ### ### ### ### ### ### ### ### ### ###


    task :foundation => :environment do
      Rake::Task["db:schema:load"].invoke
      foundation_partials_path_array = [
        Rails.root.join('db', 'seeds', 'seed_partials', 'users.rb'),
        Rails.root.join('db', 'seeds', 'seed_partials', 'categories.rb'),
        Rails.root.join('db', 'seeds', 'seed_partials', 'brands.rb'),
        Rails.root.join('db', 'seeds', 'scrapers', 'links', 'peteandpedro.rb'),
        Rails.root.join('db', 'seeds', 'scrapers', 'products', 'peteandpedro.rb'),
        # Rails.root.join('db', 'seeds', 'seed_partials', 'products', 'accessories.rb'),
        # Rails.root.join('db', 'seeds', 'seed_partials', 'products', 'bottoms.rb'),
        # Rails.root.join('db', 'seeds', 'seed_partials', 'reviews.rb'),
        Rails.root.join('db', 'seeds', 'seed_partials', 'guides.rb')
      ]

      foundation_partials_path_array.each do |foundation_partial_path|
        load(foundation_partial_path) if File.exist?(foundation_partial_path)
      end
    end


    ### BEGIN REVIEW PARTIALS ###
    namespace :review do
      Dir[Rails.root.join('db', 'seeds', 'seed_partials', 'reviews', '*.rb')].each do |filename|
        task_name = File.basename(filename, '.rb')
        desc "Seed " + task_name + ", based on the file with the same name in `db/seeds/seed_partials/*.rb`"

        task task_name.to_sym => :environment do
          load(filename) if File.exist?(filename)
        end
      end
    end # namespace :review
    ### END REIVEW PARTIALS ###


    ### BEGIN CATEGORY PARTIALS ###
    namespace :category do
      Dir[Rails.root.join('db', 'seeds', 'seed_partials', 'categories', '*.rb')].each do |filename|
        task_name = File.basename(filename, '.rb')
        desc "Seed " + task_name + ", based on the file with the same name in `db/seeds/seed_partials/*.rb`"

        task task_name.to_sym => :environment do
          load(filename) if File.exist?(filename)
        end
      end
    end
    ### END CATEGORY PARTIALS ###


    # Load individual seed_partials located under seed_partials directory
    Dir[Rails.root.join('db', 'seeds', 'seed_partials', '*.rb')].each do |filename|
      task_name = File.basename(filename, '.rb')
      desc "Seed " + task_name + ", based on the file with the same name in `db/seeds/seed_partials/*.rb`"

      task task_name.to_sym => :environment do
        load(filename) if File.exist?(filename)
      end
    end


    # task :all => :environment do
    #   Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each do |filename|
    #     load(filename)
    #   end
    # end

  end # namespace :seed


  ################################################################################
  ################################################################################
  ################################################################################


  # db:scrape: ...
  namespace :scrape do

    Dir[
      Rails.root.join('db', 'seeds', 'scrapers', 'brands', '*.rb'),
      Rails.root.join('db', 'seeds', 'scrapers', 'links', '*.rb'),
      Rails.root.join('db', 'seeds', 'scrapers', 'products', '*.rb')
    ].each do |filename|
      task_name = File.basename(filename, '.rb')
      desc "Scrape " + task_name + ", based on the files with the same name in `db/seeds/scrapers/ ['brands', 'links', 'products'] /BRAND_NAME.rb`"

      task task_name.to_sym => :environment do
        load(filename) if File.exist?(filename)
      end
    end

    # Individual files
    # BRAND_IDENTIFIER_ [brand, links, products].rb
    Dir[Rails.root.join('db', 'seeds', 'scrapers', '*', '*.rb')].each do |filename|
      task_name = File.basename(filename, '.rb')
      desc "Seed " + task_name + ", based on the file with the same name in `db/seeds/scrapers/brands/*.rb`"

      task task_name.to_sym => :environment do
        load(filename) if File.exist?(filename)
      end
    end

  end # namespace :scrape

=begin
    ### Begin: BRANDS ###
    namespace :brands do

      # All files
      Dir[Rails.root.join('db', 'seeds', 'scrapers', 'brands', '*.rb')].each do |filename|
        desc "Seed all product_scrapers based on the file with the same name in `db/seeds/scrapers/brands/*.rb`"

        task :all => :environment do
          load(filename) if File.exist?(filename)
        end
      end


      # Individual files
      Dir[Rails.root.join('db', 'seeds', 'scrapers', 'brands', '*.rb')].each do |filename|
        task_name = File.basename(filename, '.rb')
        desc "Seed " + task_name + ", based on the file with the same name in `db/seeds/scrapers/brands/*.rb`"

        task task_name.to_sym => :environment do
          load(filename) if File.exist?(filename)
        end
      end

    end
    ### End: BRANDS ###


    ### Begin: LINKS ###
    namespace :links do
      # All files
      Dir[Rails.root.join('db', 'seeds', 'scrapers', 'links', '*.rb')].each do |filename|
        # task_name = File.basename(filename, '.rb')
        desc "Seed all url_builders based on the file with the same name in `db/seeds/scrapers/links/*.rb`"

        task :all => :environment do
          load(filename) if File.exist?(filename)
        end
      end

      # Individual files
      Dir[Rails.root.join('db', 'seeds', 'scrapers', 'links', '*.rb')].each do |filename|
        task_name = File.basename(filename, '.rb')
        desc "Seed " + task_name + ", based on the file with the same name in `db/seeds/scrapers/links/*.rb`"

        task task_name.to_sym => :environment do
          load(filename) if File.exist?(filename)
        end
      end
    end
    ### End: LINKS ###



    ### Begin: PRODUCTS ###
    namespace :products do
      # All files
      Dir[Rails.root.join('db', 'seeds', 'scrapers', 'products', '*.rb')].each do |filename|
        # task_name = File.basename(filename, '.rb')
        desc "Seed all product_scrapers based on the file with the same name in `db/seeds/scrapers/products/*.rb`"

        task :all => :environment do
          load(filename) if File.exist?(filename)
        end
      end

      # Individual files
      Dir[Rails.root.join('db', 'seeds', 'scrapers', 'products', '*.rb')].each do |filename|
        task_name = File.basename(filename, '.rb')
        desc "Seed " + task_name + ", based on the file with the same name in `db/seeds/scrapers/products/*.rb`"

        task task_name.to_sym => :environment do
          load(filename) if File.exist?(filename)
        end
      end
    end
    ### End: PRODUCTS ###

  end # namespace :scrape

=end

  namespace :scraper do
    desc "Copy data from :built_links and :products tables to scraper database equivalent"
    task :copy_tables => :environment do
      built_link_entries = BuiltLink.all
      product_entries = Product.all

      # ScraperBuiltLink.delete_all
      # ScraperProduct.delete_all

      built_link_entries.each do |built_link_entry|
        create_scraped_built_link = ScraperBuiltLink.create!(
          product_name:      built_link_entry.product_name,
          product_url:       built_link_entry.product_url,
          brand_identifier:  built_link_entry.brand.brand_identifier,
          body_part_name:    built_link_entry.body_part.name,
          category_name:     built_link_entry.category.name,
          subcategory_name:  built_link_entry.subcategory.name
        )

        puts "(#{built_link_entry.id}): #{built_link_entry.product_name} by #{built_link_entry.brand.brand_identifier} [#{built_link_entry.product_url}]"
      end # built_link_entries.each

      product_entries.each do |product_entry|

        create_scraped_product = ScraperProduct.create!(
          name:                product_entry.name,
          description:         product_entry.description,
          retail_price:        product_entry.retail_price,
          gender:              product_entry.gender,
          type_of:             product_entry.type_of,
          product_url:         product_entry.product_url,
          cosmetic_attributes: product_entry.cosmetic_attributes,
          username:            product_entry.user.name,
          account_name:        product_entry.account.name,
          brand_identifier:    product_entry.brand.brand_identifier
        )

        puts create_scraped_product.name
      end # built_link_entries.each
    end # task :copy_tables
  end

end

=begin


#users_seed = Dir[Rails.root.join('db', 'seeds', 'seed_partials', 'users.rb')]
Dir[Rails.root.join('db', 'seeds', 'seed_partials', '*.rb')].each do |filename|
  next if (filename == "guides.rb" || filename == "recipes.rb" || filename == "reviews.rb" || filename == "comments.rb" || filename == "accounts.rb" || filename == "brands.rb")
  task_name = File.basename(filename, '.rb')
  desc "Seed " + task_name + ". Loads users first, then all product partials [under db/seeds/seed_partials]."
  task :users_products => :environment do
    #Rake::Task["db:seed:users"].invoke
    if File.exist?(filename)
      load(filename)
    else
      puts "#{filename} does not exist!"
    end
  end
end


Dir[Rails.root.join('db', 'seeds', 'seed_partials', '*.rb')].each do |filename|
  next if (filename == "guides.rb" || filename == "recipes.rb" || filename == "comments.rb" || filename == "accounts.rb" || filename == "brands.rb")
  task_name = File.basename(filename, '.rb')
  desc "Seed " + task_name + ". Loads users first, then all product partials [under db/seeds/seed_partials]."
  task :users_products_reviews => :environment do
    #Rake::Task["db:seed:users"].invoke
    if File.exist?(filename)
      load(filename)
    else
      puts "#{filename} does not exist!"
    end
  end
end


Dir[Rails.root.join('db', 'seeds', 'seed_partials', '*.rb')].each do |filename|
  next if (filename == "guides.rb" || filename == "recipes.rb" || filename == "accounts.rb" || filename == "brands.rb")
  task_name = File.basename(filename, '.rb')
  desc "Seed " + task_name + ". Loads users first, then all product partials [under db/seeds/seed_partials]."
  task :users_products_reviews_comments => :environment do
    #Rake::Task["db:seed:users"].invoke
    if File.exist?(filename)
      load(filename)
    else
      puts "#{filename} does not exist!"
    end
  end
end

  # Under namespace db:seed
### BEGIN PRODUCT PARTIALS (INDIVIDUAL) ###
Dir[Rails.root.join('db', 'seeds', 'seed_partials', 'products', '*.rb')].each do |filename|
  task_name = File.basename(filename, '.rb')
  desc "Seed " + task_name + ", based on the file with the same name in `db/seeds/seed_partials/*.rb`"

  task task_name.to_sym => :environment do
    load(filename) if File.exist?(filename)
  end
end
### END PRODUCT PARTIALS (INDIVIDUAL) ###

  # Under namespace db:seed
### BEGIN PRODUCT PARTIALS (ALL) ###
Dir[Rails.root.join('db', 'seeds', 'seed_partials', 'products', '*.rb')].each do |filename|
  #next if (filename == "users.rb" || filename == "guides.rb" || filename == "recipes.rb" || filename == "reviews.rb" || filename == "comments.rb" || filename == "accounts.rb" || filename == "brands.rb")
  task_name = File.basename(filename, '.rb')
  desc "Seed " + task_name + ". Loads all product partials [under db/seeds/seed_partials]."

  task :all_products => :environment do
    load(filename) if File.exist?(filename)
  end
end
### END PRODUCT PARTIALS (ALL) ###

=end
