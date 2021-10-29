class NotesController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:show]

  def show
    @note = Note.find(params[:id]) 
    @pagy, @comments = pagy(Comment.where(note_id: params[:id]))
    @comment = Comment.new
  end

  def new
#    @user = User.find(params[:id])
#    @user = User.new
    @note = Note.new
  end

  def create
    @note = current_user.notes.build(note_params)
    if @note.save
      flash[:success] = 'ノートを投稿しました。'
      redirect_to user_path(current_user.id)
    else
      @note = Note.new
#      @pagy, @notes = pagy(current_user.notes.order(id: :desc))
#      flash.now[:danger] = 'ノートの投稿に失敗しました。'
      flash.now[:danger] = 'ノートの投稿に失敗しました。'
#      redirect_to user_path(current_user.id), alert: 'ノートの投稿に失敗しました'
#      redirect_to note_path
      render :new
#      render template: "users/show"
#      元々のコントローラーのインスタンスを再生成する必要がある。
    end
  end

private

  def correct_user
    
    note = Note.find(params[:id]) 

    if current_user.family_id == note.user.family_id
    else
      redirect_to root_url
    end
  end
  
  def note_params
    params.require(:note).permit(:subject_id,:status,:note,:user_id)
  end

end
