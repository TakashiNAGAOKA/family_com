class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]

  def index
    @pagy, @users = pagy(User.order(id: :desc), items: 25)
  end
  
  def show
    @user = User.find(params[:id])
    @pagy,@notes = pagy(Note.where(user_id: params[:id]).order(created_at: :desc))

  end

  def new
    @family = Family.new
    @user = User.new
  end

  def create
    @family = Family.new(family_params[:family])
    @family.save
    @user = User.new(user_params)
    @user.family_id = @family.id

    if (@user.save)
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
      
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
private
  
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end

  def family_params
    params.require(:user).permit(family:[:name])
  end

end
