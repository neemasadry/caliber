class SearchController < ApplicationController

  #before_action :force_json, only: :autocomplete

  def autocomplete
    query = params[:q].presence || "*" # Check to see if params[:q] is present OR return default value "*" if not present

      @accessories = Accessory.search(query, fields: [:name, :brand], match: :word_start, limit: 3)
      @bottoms     = Bottom.search(query, fields: [:name, :brand], match: :word_start, limit: 3)
      @cosmetics   = Cosmetic.search(query, fields: [:name, :brand], match: :word_start, limit: 3)
      @dresses     = Dress.search(query, fields: [:name, :brand], match: :word_start, limit: 3)
      @fragrances  = Fragrance.search(query, fields: [:name, :brand], match: :word_start, limit: 3)
      @shoes       = Shoe.search(query, fields: [:name, :brand], match: :word_start, limit: 3)
      @tops        = Top.search(query, fields: [:name, :brand], match: :word_start, limit: 3)

      @catalogs    = Catalog.search(query, fields: [:title, :category], match: :word_start, limit: 3)
      @outfits     = Outfit.search(query, fields: [:name, :occasion, :dress_code], match: :word_start, limit: 3)
      @guides      = Guide.search(query, fields: [:title], match: :word_start, limit: 3)
      @users       = User.search(query, fields: [:username], match: :word_start, limit: 3)

      @autocomplete_array = [@accessories, @bottoms, @cosmetics, @dresses, @fragrances, @shoes, @tops, @guides, @users]

      @autocomplete_hash = {
        product: {
          "accessories": @accessories,
          "bottoms": @bottoms,
          "cosmetics": @cosmetics,
          "dresses": @dresses,
          "fragrances": @fragrances,
          "shoes": @shoes,
          "tops": @tops
        },
        "guides": @guides,
        "users": @users
      }

      render template: "search/autocomplete.html.erb", layout: false

  end

  def search
    query = params[:q].presence || "*" # Check to see if params[:q] is present OR return default value "*" if not present

    if params[:q].present? && params.has_key?(:q)

      accessories = Accessory.pagy_search(query)
      bottoms     = Bottom.pagy_search(query)
      cosmetics   = Cosmetic.pagy_search(query)
      dresses     = Dress.pagy_search(query)
      fragrances  = Fragrance.pagy_search(query)
      jewelries   = Jewelry.pagy_search(query)
      shoes       = Shoe.pagy_search(query)
      tops        = Top.pagy_search(query)

      catalogs    = Catalog.pagy_search(query)
      outfits     = Outfit.pagy_search(query)
      guides      = Guide.pagy_search(query)
      users       = User.pagy_search(query)

      @pagy_accessories, @accessories = pagy_searchkick(accessories, fields: [:name, :brand], match: :word_start, per_page: 10, page_param: :accessories_page, page: params[:page])
      @pagy_bottoms, @bottoms         = pagy_searchkick(bottoms, fields: [:name, :brand], match: :word_start, per_page: 10, page_param: :bottoms_page, page: params[:page])
      @pagy_cosmetics, @cosmetics     = pagy_searchkick(cosmetics, fields: [:name, :brand], match: :word_start, per_page: 10, page_param: :cosmetics_page, page: params[:page])
      @pagy_dresses, @dresses         = pagy_searchkick(dresses, fields: [:name, :brand], match: :word_start, per_page: 10, page_param: :dresses_page, page: params[:page])
      @pagy_jewelries, @jewelries     = pagy_searchkick(jewelries, fields: [:name, :brand], match: :word_start, per_page: 10, page_param: :fragrances_page, page: params[:page])
      @pagy_fragrances, @fragrances   = pagy_searchkick(fragrances, fields: [:name, :brand], match: :word_start, per_page: 10, page_param: :jewelries_page, page: params[:page])
      @pagy_shoes, @shoes             = pagy_searchkick(shoes, fields: [:name, :brand], match: :word_start, per_page: 10, page_param: :shoes_page, page: params[:page])
      @pagy_tops, @tops               = pagy_searchkick(tops, fields: [:name, :brand], match: :word_start, per_page: 10, page_param: :tops_page, page: params[:page])

      @pagy_catalogs, @catalogs       = pagy_searchkick(catalogs, fields: [:title, :category], match: :word_start, per_page: 10, page_param: :guides_page, page: params[:page])
      @pagy_outfits, @outfits         = pagy_searchkick(outfits, fields: [:name, :occasion, :dress_code], match: :word_start, per_page: 10, page_param: :guides_page, page: params[:page])
      @pagy_guides, @guides           = pagy_searchkick(guides, fields: [:title], match: :word_start, per_page: 10, page_param: :guides_page, page: params[:page])
      @pagy_users, @users             = pagy_searchkick(users, fields: [:username], match: :word_start, per_page: 10, page_param: :users_page, page: params[:page])

      @result_categories_array = [@accessories, @bottoms, @cosmetics, @dresses, @fragrances, @shoes, @tops, @guides, @users]

      @result_categories = {
        accessories: @accessories,
        bottoms: @bottoms,
        cosmetics: @cosmetics,
        dresses: @dresses,
        fragrance: @fragrances,
        jewelries: @jewelries,
        shoes: @shoes,
        tops: @tops }

    else
      redirect_to root_path, flash: { warning: "Search field must contain a value." }
    end
  end

  private

    def force_json
      request.format = :json
    end

end
