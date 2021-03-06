module Products
  extend ActiveSupport::Concern

  included do

    extend FriendlyId
    extend Pagy::Search

    belongs_to :user
    belongs_to :account
    belongs_to :brand
    belongs_to :productable, polymorphic: true, optional: true

    has_many_attached :images

    # Begin: Categorization
    has_many :productable_body_part_items, dependent: :destroy, as: :productable
    has_many :body_parts, through: :productable_body_part_items, as: :productable

    has_many :productable_category_items, dependent: :destroy, as: :productable
    has_many :categories, through: :productable_category_items, as: :productable

    has_many :productable_subcategory_items, dependent: :destroy, as: :productable
    has_many :subcategories, through: :productable_subcategory_items, as: :productable
    # End: Categorization

    has_many :reviews, as: :reviewable, dependent: :destroy
    has_many :collectable_items
    has_many :collections, through: :collectable_items
    has_many :outfit_items
    has_many :outfits, through: :outfit_items, as: :productable

    friendly_id :name, use: :slugged

    # has_ancestry
    acts_as_favoritable
    acts_as_votable

    searchkick word_start: [:name, :brand], word_middle: [:name, :brand], text_middle: [:primary_color]

    validates :name, presence: true, length: { maximum: 100 }
    validates :description, presence: true, length: { maximum: 3000 }
    validates :retail_price, presence: true, numericality: { greater_than: 0, less_than: 1000000 }
    validates :type_of, presence: true, inclusion: { in: ["Accessory", "Bottom", "Cosmetic", "Dress", "Fragrance", "Jewelry", "Shoe", "Suit", "Top"] }
    validates :gender, presence: true, numericality: { in: 1..3 }
    # validates :materials, presence: true, length: { minimum: 3, maximum: 150 }, if: :has_material_or_colors?
    # validates :ingredients, presence: true, length: { minimum: 3, maximum: 3000 }, if: :has_ingredients?
    # validates :primary_color, presence: true, length: { minimum: 2, maximum: 30 }, if: :has_material_or_colors?
    # validates :secondary_color, presence: false, length: { minimum: 2, maximum: 30 }, if: :has_material_or_colors?

    # Searchkick specific scope
    scope :search_import, -> { includes(:brand) }

    # Custom scopes
    # scope :body_part_matches_type_of, -> { where(body_part: "Eyes") }
    scope :select_collection, -> { body_part_matches_type_of.map { |product| [product.name, product.id, { url: Rails.application.routes.url_helpers.polymorphic_path(product) } ] } }

  end # included

  def search_data
    if self.class.name == "Cosmetic" || self.class.name == "Fragrance"
      {
        name: name,
        brand: brand.name,
        # body_part: body_part,
        # category: category,
        # subcategory: subcategory,
        ingredients: ingredients,
      }
    else
        {
          name: name,
          brand: brand.name,
          # body_part: body_part,
          # category: category,
          # subcategory: subcategory,
          primary_color: primary_color,
          secondary_color: secondary_color
        }
    end
  end

  def has_gender?
    self.class.name == "Dress"
  end

  def has_material_or_colors?
    self.class.name != "Cosmetic" && self.class.name != "Fragrance"
  end

  def has_ingredients?
    self.class.name == "Cosmetic" && self.class.name == "Fragrance"
  end

  def has_type_of?
    self.class.name != "Fragrance"
  end

  # Wicked
  # def active?
  #   status == 'active'
  # end

  # def active_or_productable_type?
  #   status.include?('productable_type') || active?
  # end

end
