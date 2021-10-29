class FamiliesController < ApplicationController
  before_action :correct_user, only: [:show]

  def show
    @family = Family.find(current_user.family_id)
    @pagy,@users = pagy(User.where(family_id: current_user.family_id))
  end

  def new
   @user = User.new
  end

  def create
    @family = Family.find(current_user.family_id)
    @user = User.new(user_params)
    @user.family_id = @family.id

    if (@user.save)
      flash[:success] = 'ユーザを登録しました。'
      redirect_to family_path(current_user.family_id)
      
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
private
  def correct_user
#    binding.pry
    
    family = Family.new
    user = User.find(params[:id])

#    binding.pry

    family.id = user.family_id

#    binding.pry

    if current_user.family_id == family.id
    else
      redirect_to root_url
    end
  end
  
    def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
    end

end
