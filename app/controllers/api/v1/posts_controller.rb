class Api::V1::PostsController < SecuredController
  skip_before_action :authorize_request, only: [:index, :show]

  def index
    posts = Post.all
    # render json: posts
    render json: PostSerializer.new(posts.sorted)
  end

  def show
    post = Post.find(params[:id])
    render json: PostSerializer.new(post)
  rescue ActiveRecord::RecordNotFound
    head :not_found
  end

  def create
    post = Post.create!(post_params)
    render json: PostSerializer.new(post), status: :created
  end

  def by_user
    posts = Post.where('user_id = ?', params[:id])
    render json: PostSerializer.new(posts.sorted)
  end

  def destroy
    post = Post.find(params[:id])
    post.delete
    head :no_content
  end

  private

  def post_params
    params.permit(:text, :user_id, :likes, :repost_count)
  end
end
