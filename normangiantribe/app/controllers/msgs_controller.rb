class MsgsController < ApplicationController
    before_action :set_msg, only: [:edit,:update,:show,:destroy]
    before_action :require_user
    before_action :require_same_user, only: [ :edit, :update, :destroy ]
    def index
        @msgs = Msg.all
    end

    def show

    end

    def new
        @msg = Msg.new
    end

    def create
        if @msg.create(msg_params)
            flash[:success] = "Post was successfully updated"
            redirect_to msg_path(msg)
        else
            render 'show'
        end
    end

    def edit

    end

    def update
        if @msg.update(msg_params)
            flash[:success] = "Post was successfully updated"
            redirect_to msg_path(msg)
        else
            render 'edit'
        end
    end

    private
        def msg_params
            params.require(:msg).permit(:title, :body)
        end
        def set_msg
            @msg = msg.find(params[:id])
        end
        def require_same_user
            if current_user != @msg.user and !current_user.admin?
                flash[:danger] = "You can only edit your own messages!"
                redirect_to root_path
            end
        end
end
