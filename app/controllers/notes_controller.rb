class NotesController < ApplicationController
    before_action :require_user_logged_in

    def show
#        binding.pry
#        @user = User.find(params[:user_id])
        @note = Note.find(params[:id])
#        binding.pry
#        @pagy, notes = pagy(@user.notes.order(id: :desc))
#        binding.pry
#        @pagy,@notes = pagy(@notes.order(id: :desc))
#        binding.pry
    end

    def new
        @user = User.find(params[:user_id])
        @note = Note.new
    end

  def create
    @note = current_user.notes.build(note_params)
    if @note.save
      flash[:success] = 'ノートを投稿しました。'
      redirect_to root_url
    else
      @pagy, @notes = pagy(current_user.notes.order(id: :desc))
      flash.now[:danger] = 'ノートの投稿に失敗しました。'
      render 'toppages/index'
    end
  end
  
    def edit
        
    end

private
    
    def note_params
        params.require(:note).permit(:subject_id,:status,:note,:user_id)
    end

end
