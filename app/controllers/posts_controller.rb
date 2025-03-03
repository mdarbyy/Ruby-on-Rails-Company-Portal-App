class PostsController < ApplicationController
  before_action :check_if_user_is_admin, except: %i[show]
  before_action :set_post, only: %i[ show edit update destroy ]

  # GET /posts or /posts.json
  def index
    @limit = Setting.first.entity_limit
    offset = params[:offset].to_i || 0
    @posts = Post.all.limit(@limit).offset(offset).order(updated_at: :desc, schedule: :desc)
    @total_records = Post.all.count

    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path, success: "Post was created" }
        format.json { render :show, status: :created, location: @post }
      else
        flash[:danger] = @post.errors.full_messages.first
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    existing_files = @post.files
    
    respond_to do |format|
      if @post.update(post_params.except(:files))

        existing_files.each do |file|
          @post.files.attach(file.blob)
        end

        # If there are new files in the params, attach them as well
        if params[:post][:files].present?
          @post.files.attach(params[:post][:files])
        end

        format.html { redirect_to posts_path, success: "Post was updated" }
        format.json { render :show, status: :ok, location: @post }
      else
        flash[:danger] = @post.errors.full_messages.first
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_path, success: "Post was deleted" }
      format.json { head :no_content }
    end
  end

  def remove_attachment
    @post = Post.find(params[:id])
    attachment = @post.files.find(params[:file_id])
    attachment.purge
    respond_to do |format|
      format.js { render layout: false }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def check_if_user_is_admin
      unless current_user.isAdmin?
        redirect_to root_path, danger: "You are not authorized to view this page"
      end
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :body, :schedule, :isImportant, files: [])
    end
end
