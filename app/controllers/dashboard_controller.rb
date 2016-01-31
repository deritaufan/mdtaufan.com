class DashboardController < ApplicationController
    before_action :authenticate_admin!
    def main
    end
    
    def add_post
        @post = Blog.new
    end
    
    def create_post
    end
end
