class CategoriesController < ApplicationController
    before_action :require_admin, except: [:index, :show]
    def index
        @categories = Category.paginate(page: params[:page],per_page: 5)
    end

    def new
        @category = Category.new
    end

    def show

    end

    def create
        @category = Category.new(params_category)
        if @category.save
            flash[:success] = "Category was created successfully"
            redirect_to categories_path
        else
            render 'new'
        end
    end

    private
        def params_category
            params.require(:category).permit(:name)
        end
        def require_admin
            if logged_in? and !current_user.admin?
                flash[:danger] = "You need elevated permissions to do that!"
                redirect_to categories_path
            end
        end

end
  