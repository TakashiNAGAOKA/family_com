class NotesController < ApplicationController
  before_action :require_user_logged_in

  def show
    @note = Note.find(params[:id]) 
    @pagy, @comments = pagy(Comment.where(note_id: params[:id]))
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

private
    
  def note_params
    params.require(:note).permit(:subject_id,:status,:note,:user_id)
  end

end
