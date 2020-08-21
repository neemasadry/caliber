module Products
  extend ActiveSupport::Concern

  included do

    extend FriendlyId
    extend Pagy::Search

    belongs_to :user
    belongs_to :brand

    has_many_attached :images

    has_many :reviews, as: :reviewable, dependent: :destroy
    has_many :collectable_items
    has_many :collections, through: :collectable_items
    has_many :outfit_items
    has_many :outfits, through: :outfit_items, as: :productable

    friendly_id :name, use: :slugged

    acts_as_favoritable
    acts_as_votable

    searchkick word_start: [:name, :brand], word_middle: [:name, :brand], text_middle: [:type_of, :primary_color]

    validates :name, presence: true, length: { maximum: 100 }
    validates :description, presence: true, length: { maximum: 3000 }
    validates :retail_price, presence: true, numericality: { greater_than: 0, less_than: 1000000 }
    validates :type_of, presence: true, if: :has_type_of?
    validates :gender, presence: true, length: { maximum: 6 }, unless: :has_gender?
    validates :materials, presence: true, length: { minimum: 3, maximum: 150 }, if: :has_material_or_colors?
    validates :ingredients, presence: true, length: { minimum: 3, maximum: 3000 }, if: :has_ingredients?
    validates :primary_color, presence: true, length: { minimum: 2, maximum: 30 }, if: :has_material_or_colors?
    validates :secondary_color, presence: false, length: { minimum: 2, maximum: 30 }, if: :has_material_or_colors?

    scope :search_import, -> { includes(:brand) }

  end # included

  def search_data
    {
      name: name,
      brand: brand.name,
      type_of: type_of,
      primary_color: primary_color
    }
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

end
