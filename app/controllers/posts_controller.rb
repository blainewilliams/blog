class PostsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	def index
		@posts = Post.all.order('created_at DESC')
	end
	def new
		@post = Post.new
	end
	def create
		@post = Post.new(post_params)
		if @post.save
			redirect_to @post
		else 
			render 'new'
		end
	end
	def show
		@post = Post.find(params[:id])
	end
	def edit
		@post = Post.find(params[:id])
	end
	def update
		@post = Post.find(params[:id])

		if @post.update(params[:post].permit(:title, :body, :image))
			redirect_to @post
		else
			render 'edit'
		end
	end
	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to root_path
	end
	def remove_image
		@post = Post.find(params[:id])
		@post.image = nil
		@post.save
		redirect_to edit_post_path, flash: { success: 'Image has been removed.' }
	end

	private
		def post_params
			params.require(:post).permit(:title, :body, :image, :bootsy_image_gallery_id )
		end
end
