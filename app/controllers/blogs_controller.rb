class BlogsController < ApplicationController
    def index
        @blogs = Blog.paginate(:page => params[:page], per_page: 8).order('created_at DESC')
    end
    
    def show
        @blog = Blog.find(params[:id])
    end
end
