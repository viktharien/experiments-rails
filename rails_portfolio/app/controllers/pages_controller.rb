class PagesController < ApplicationController

    def home
        @posts = Blog.all
        @skills = Skill.all
    end
end
