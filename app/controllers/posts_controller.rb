class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy, :like]

  #after_action :verify_authorized

  # GET /posts
  def index
    if current_user.admin?
      @pagy, @posts = pagy(Post.sort_by_params(params[:sort], sort_direction))

      # We explicitly load the records to avoid triggering multiple DB calls in the views when checking if records exist and iterating over them.
      # Calling @posts.any? in the view will use the loaded records to check existence instead of making an extra DB call.
      @posts.load
    else
      redirect_to root_path, flash: { danger: "Authorization failed. Restricted access." }
    end
  end

  # GET /posts/1
  def show
    votable_on_show_action
    @model_name = "Post"
    @pagy, @all_comments = pagy(@post.comments.where(parent_id: 0), items: 7)
  end

  # GET /posts/new
  def new
    @user_profile = current_user
    @post = Post.new
  end

  # GET /posts/1/edit
  # def edit
  # end

  # POST /posts
  def create
    @post = Post.new(post_params)

    @post.user = current_user
    @post.account = current_account

    unless current_account.personal?
      @post.brand = current_account.brand
    else
      @post.brand = nil
    end

    if @post.save
      NewPost.with(post: @post).deliver_later(@post.user.favoritors(scope: :user_follow))
      redirect_to @post, notice: "Post was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /posts/1
  # def update
  #   if @post.update(post_params)
  #     redirect_to @post, notice: "Post was successfully updated."
  #   else
  #     render :edit
  #   end
  # end

  # DELETE /posts/1
  def destroy
    @post.destroy
    redirect_to posts_url, notice: "Post was successfully destroyed."
  end

  def like # acts_as_votable
    if current_user.liked? @post
      @post.unliked_by(current_user)
      redirect_to(post_path(@post), flash: { warning: "You unliked this post." })
    elsif current_user.id != @post.user_id
      @post.liked_by(current_user)
      redirect_to(post_path(@post), flash: { success: "You like this post." })
    else
      redirect_to(root_path, flash: { danger: "An error occurred. Redirected to homepage." })
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def post_params
    params.require(:post).permit(:content, :post_image, :post_video, :post_tag_list)
  end
end
