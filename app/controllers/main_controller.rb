class MainController < ApplicationController
    def main
        @images = Image.where(in_front_page: true).order(created_at: :desc).limit(4);
        @posts = Post.order(date: :desc).limit(2);
    end
end
