class DashboardController < ApplicationController
    before_action :authenticate_admin!
    def main
    end
    
    def add_post
        @blog = Blog.new
    end
    
    def list_post
        @blogs = Blog.paginate(:page => params[:page], per_page: 15).order('created_at DESC')
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
    
    def delete_post
        @blog = Blog.find(params[:id])
        if @blog.destroy
            flash[:success] = "Post deleted."
            redirect_to action: "list_post"
        else
            flash[:danger] = "Error occured, post has not been deleted."
            render action: "list_post"
        end
    end
    
    def edit_post
        @blog = Blog.find(params[:id])
    end
    
    def update_post
        @blog = Blog.find(params[:id])
        if @blog.update_attributes(blog_params)
            flash[:success] = "Blog updated."
            redirect_to action: :list_post
        else
            flash[:danger] = "Error occured, post has not been updated."
            render action: :edit_post
        end
    end
    
    private
        def blog_params
            params.require(:blog).permit(:title, :sub_title, :post)
        end
end
