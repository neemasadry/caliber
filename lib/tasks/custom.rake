# lib/tasks/custom_seed.rake
namespace :db do
  namespace :seed do

    ### REVIEW PARTIALS ###
    namespace :review do
      Dir[Rails.root.join('db', 'seeds', 'seed_partials', 'review_partials', '*.rb')].each do |filename|
        task_name = File.basename(filename, '.rb')
        desc "Seed " + task_name + ", based on the file with the same name in `db/seeds/seed_partials/*.rb`"

        task task_name.to_sym => :environment do
          load(filename) if File.exist?(filename)
        end
      end

    end # namespace :review
    ### END REIVEW PARTIALS ###

    Dir[Rails.root.join('db', 'seeds', 'seed_partials', '*.rb')].each do |filename|
      task_name = File.basename(filename, '.rb')
      desc "Seed " + task_name + ", based on the file with the same name in `db/seeds/seed_partials/*.rb`"

      task task_name.to_sym => :environment do
        load(filename) if File.exist?(filename)
      end
    end

    desc "Seed all User entries in db/seed_partials/users.rb"
    task :reset_dcm => :environment do
      Rake::Task["db:drop"].invoke
      Rake::Task["db:create"].invoke
      Rake::Task["db:migrate"].invoke
    end

    Dir[Rails.root.join('db', 'seeds', 'seed_partials', '*.rb')].each do |filename|
      next if (filename == "users.rb" || filename == "guides.rb" || filename == "recipes.rb" || filename == "reviews.rb" || filename == "comments.rb" || filename == "accounts.rb" || filename == "brands.rb")
      task_name = File.basename(filename, '.rb')
      desc "Seed " + task_name + ". Loads all product partials [under db/seeds/seed_partials]."
      task :all_products => :environment do
        load(filename) if File.exist?(filename)
      end
    end

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

    # task :all => :environment do
    #   Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each do |filename|
    #     load(filename)
    #   end
    # end

  end
end
