class DashboardController < ApplicationController
    before_action :authenticate_admin!
    def main
    end
    
    def add_post
        @blog = Blog.new
    end
    
    def create_post
        @blog = Blog.new(blog_params)
        
        if @blog.save
            flash[:success] = "Post saved."
            redirect_to dashboard_add_post_path
        else
            flash[:danger] = "Error occured, post has not been saved."
            redirect_to dashboard_add_post_path
        end
    end
    
    private
        def blog_params
            params.require(:blog).permit(:title, :sub_title, :post)
        end
end
