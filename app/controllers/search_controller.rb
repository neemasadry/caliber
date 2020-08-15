class SearchController < ApplicationController

  #before_action :force_json, only: :autocomplete

  def autocomplete
    query = params[:q].presence || "*" # Check to see if params[:q] is present OR return default value "*" if not present

    # if params[:q].present? && params.has_key?(:q)
      @accessories = Accessory.search(query, fields: [:name, :brand], match: :word_start, limit: 5)
      @bottoms     = Bottom.search(query, fields: [:name, :brand], match: :word_start, limit: 5)
      @cosmetics   = Cosmetic.search(query, fields: [:name, :brand], match: :word_start, limit: 5)
      @dresses     = Dress.search(query, fields: [:name, :brand], match: :word_start, limit: 5)
      @fragrances  = Fragrance.search(query, fields: [:name, :brand], match: :word_start, limit: 5)
      @shoes       = Shoe.search(query, fields: [:name, :brand], match: :word_start, limit: 5)
      @tops        = Top.search(query, fields: [:name, :brand], match: :word_start, limit: 5)

      @guides      = Guide.search(query, fields: [:title], match: :word_start, limit: 5)
      @users       = User.search(query, fields: [:username], match: :word_start, limit: 5)

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

    # end

    # else
    #   ### REMOVE else block after development! ###
    #   @accessories = Accessory.search(query, limit: 10)
    #   @bottoms     = Bottom.search(query, limit: 10)
    #   @cosmetics   = Cosmetic.search(query, limit: 10)
    #   @dresses     = Dress.search(query, limit: 10)
    #   @fragrances  = Fragrance.search(query, limit: 10)
    #   @guides      = Guide.search(query, limit: 10)
    #   @shoes       = Shoe.search(query, limit: 10)
    #   @tops        = Top.search(query, limit: 10)
    # end

    # :term from params[:term] is the parameter that jQuery-UI autocomplete library sends back
    #@fragrances = Fragrance.search(params[:term], fields: [{name: :word_start},{brand: :word_start}], limit: 10)
    #@search_results = Searchkick.search(params[:term], models: [Accessory, Bottom, Cosmetic, Dress, Fragrance, Guide, Jewelry, Shoe, Top, User], fields: [{name: :word_start},{brand: :word_start}], limit: 5)
    #Searchkick.search("dior", models: [Accessory, Bottom, Cosmetic, Dress, Fragrance, Guide, Jewelry, Shoe, Top, User], fields: [{name: :word_start},{brand: :word_start}], limit: 5)

    #render json: @search_results.map { |result| { id: result.id, name: result.name, brand: result.brand } }

  end

  def search
    query = params[:q].presence || "*" # Check to see if params[:q] is present OR return default value "*" if not present

    if params[:q].present? && params.has_key?(:q)
      @accessories = Accessory.search(query, fields: [:name, :brand], match: :word_start, limit: 20)
      @bottoms     = Bottom.search(query, fields: [:name, :brand], match: :word_start, limit: 20)
      @cosmetics   = Cosmetic.search(query, fields: [:name, :brand], match: :word_start, limit: 20)
      @dresses     = Dress.search(query, fields: [:name, :brand], match: :word_start, limit: 20)
      @fragrances  = Fragrance.search(query, fields: [:name, :brand], match: :word_start, limit: 20)
      @shoes       = Shoe.search(query, fields: [:name, :brand], match: :word_start, limit: 20)
      @tops        = Top.search(query, fields: [:name, :brand], match: :word_start, limit: 20)

      if @users.present?
        @result_categories = {
          "Accessories": @accessories,
          "Bottoms": @bottoms,
          "Cosmetics": @cosmetics,
          "Dresses": @dresses,
          "Fragrances": @fragrances,
          "Jewelries": @jewelries,
          "Shoes": @shoes,
          "Tops": @tops }

          @guides = Guide.search(query, fields: [:title], match: :word_start, limit: 20)

          @users = User.search(query, fields: [:first_name, :last_name, :username], match: :word_start, limit: 5)
        @sliced = @result_categories.each_slice(2).map(&:to_h)
      else
        @result_categories = {
          "Accessories": @accessories,
          "Bottoms": @bottoms,
          "Cosmetics": @cosmetics,
          "Dresses": @dresses,
          "Fragrances": @fragrances,
          "Jewelries": @jewelries,
          "Shoes": @shoes,
          "Tops": @tops }

          @guides = Guide.search(query, fields: [:title], match: :word_start, limit: 20)
          @sliced = @result_categories.each_slice(2).map(&:to_h)
      end

    else
      redirect_to root_path, notice: "Search field must contain a value."
    end
  end

  private

    def force_json
      request.format = :json
    end

end
