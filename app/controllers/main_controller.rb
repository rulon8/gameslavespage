class MainController < ApplicationController
    def main
        @pictures = Picture.where(in_front_page: true).order(created_at: :desc).limit(4);
        @posts = Post.order(date: :desc).limit(3);
    end
    
    def about
    end
    
    def in_development
    end
end
