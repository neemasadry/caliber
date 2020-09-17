# lib/tasks/custom_seed.rake
namespace :db do
  namespace :seed do

    ### BEGIN DROP, CREATE, MIGRATE DATABASE ###
    desc "Seed all User entries in db/seed_partials/users.rb"
    task :reset_dcm => :environment do
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
        Rails.root.join('db', 'seeds', 'seed_partials', 'products', 'accessories.rb'),
        Rails.root.join('db', 'seeds', 'seed_partials', 'products', 'bottoms.rb'),
        Rails.root.join('db', 'seeds', 'seed_partials', 'reviews.rb'),
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


    ### BEGIN PRODUCT PARTIALS (INDIVIDUAL) ###
    Dir[Rails.root.join('db', 'seeds', 'seed_partials', 'products', '*.rb')].each do |filename|
      task_name = File.basename(filename, '.rb')
      desc "Seed " + task_name + ", based on the file with the same name in `db/seeds/seed_partials/*.rb`"

      task task_name.to_sym => :environment do
        load(filename) if File.exist?(filename)
      end
    end
    ### END PRODUCT PARTIALS (INDIVIDUAL) ###


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

    ### Begin: URL_BUILDERS ###
    namespace :url_builder do
      # All files
      Dir[Rails.root.join('db', 'seeds', 'scrapers', 'url_builders', '*.rb')].each do |filename|
        # task_name = File.basename(filename, '.rb')
        desc "Seed all url_builders based on the file with the same name in `db/seeds/url_builders/*.rb`"

        task :all => :environment do
          load(filename) if File.exist?(filename)
        end
      end

      # Individual files
      Dir[Rails.root.join('db', 'seeds', 'scrapers', 'url_builders', '*.rb')].each do |filename|
        task_name = File.basename(filename, '.rb')
        desc "Seed " + task_name + ", based on the file with the same name in `db/seeds/url_builders/*.rb`"

        task task_name.to_sym => :environment do
          load(filename) if File.exist?(filename)
        end
      end
    end
    ### End: URL_BUILDERS ###



    ### Begin: PRODUCT_SCRAPERS ###
    namespace :product_scraper do
      # All files
      Dir[Rails.root.join('db', 'seeds', 'scrapers', 'product_scrapers', '*.rb')].each do |filename|
        # task_name = File.basename(filename, '.rb')
        desc "Seed all product_scrapers based on the file with the same name in `db/seeds/product_scrapers/*.rb`"

        task :all => :environment do
          load(filename) if File.exist?(filename)
        end
      end
      # Individual files
      Dir[Rails.root.join('db', 'seeds', 'scrapers', 'product_scrapers', '*.rb')].each do |filename|
        task_name = File.basename(filename, '.rb')
        desc "Seed " + task_name + ", based on the file with the same name in `db/seeds/product_scrapers/*.rb`"

        task task_name.to_sym => :environment do
          load(filename) if File.exist?(filename)
        end
      end
    end
    ### End: PRODUCT_SCRAPERS ###

  end # namespace :scrape

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

=end
