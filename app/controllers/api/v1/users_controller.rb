class Api::V1::PostsController < SecuredController
  skip_before_action :authorize_request, only: [:create]

  def create
    post = Post.create!(post_params)
    render json: PostSerializer.new(post), status: :created
  end
