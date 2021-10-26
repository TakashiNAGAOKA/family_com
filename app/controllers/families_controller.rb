class FamiliesController < ApplicationController

  def show
#    binding.pry
    @pagy,@users = pagy(User.where(family_id: current_user.family_id))
#    binding.pry
  end

  def new
#   binding.pry
#   @family = Family.find(current_user.family_id)
   
#   binding.pry
   
   @user = User.new
#   binding.pry
       
  end

  def create
#  transactionを貼る必要がある。
#  family.save、idをuserにセット、userをsave

#    @family = Family.new(family_params[:family])
#    @family.save
   @family = Family.find(current_user.family_id)

#    binding.pry

#    @user = User.new(user_params[:user])
    @user = User.new(user_params)

#    binding.pry
    
#    @user.family_id = current_user.family_id
    @user.family_id = @family.id

#    binding.pry

    if (@user.save)
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
      
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
#   redirect_to users_path(@user)
  end
  
  def update
#  transactionを貼る必要がある。
#  family.save、idをuserにセット、userをsave

#    @family = Family.new(family_params[:family])
#    @family.save
    @user = User.new(user_params[:family])
    @user.family_id = current_user.family_id
    
    if (@user.save)
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
      
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
#   redirect_to users_path(@user)
  end
  
  
  
#  def add_family_user
#    @user = User.new
#  end

  private
  
    def user_params
#    params.require(:user).permit(:name,:email,:password,:password_confirmation ,family_attributes:[:id, :name])
#    params.require(:family).permit(user:[:name,:email,:password,:password_confirmation])
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
    end

    def family_params
#    params.require(:user).permit(:name,:email,:password,:password_confirmation ,family_attributes:[:id, :name])
#    params.require(:user).permit(family:[:name])
#    params.require(:family).permit(user:[:name,:email,:password,:password_confirmation])
    end

end
