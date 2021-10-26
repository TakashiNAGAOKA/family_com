class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]

  def index
    @pagy, @users = pagy(User.order(id: :desc), items: 25)
  end
  
  def show
    @user = User.find(params[:id])
    @pagy,@notes = pagy(Note.where(user_id: current_user.id).order(created_at: :desc))
    #@pagy,@users = pagy(User.where(family_id: current_user.family_id))

  end

  def new
#    @user.build_family    
    @family = Family.new
    @user = User.new
  end

  def create
#  transactionを貼る必要がある。
#  family.save、idをuserにセット、userをsave

    @family = Family.new(family_params[:family])
    @family.save
    @user = User.new(user_params)
    @user.family_id = @family.id
    
#        binding.pry
    
    if (@user.save)
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
      
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
#   redirect_to users_path(@user)
  end
  
  private
  
    def user_params
#    params.require(:user).permit(:name,:email,:password,:password_confirmation ,family_attributes:[:id, :name])
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
    end

    def family_params
#    params.require(:user).permit(:name,:email,:password,:password_confirmation ,family_attributes:[:id, :name])
    params.require(:user).permit(family:[:name])
    end
end
