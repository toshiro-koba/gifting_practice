class UsersController < ApplicationController
  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @users = User.all
    @user = User.find(params[:id])

    @all_gifts_in_table = Gift.all
    
    @giftings = []
    @all_gifts_in_table.each do |gift|
      if gift.giver_id == current_user.id
        @giftings << gift
      end
    end

    @receivings = []
    @all_gifts_in_table.each do |gift|
      if gift.user_id == current_user.id
        @receivings << gift
      end
    end
    # binding.pry
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email)
  end
end


# def index
#   @rooms = Room.all.order('created_at DESC')
#   @another_questions = []
#   if user_signed_in?
#     @entries = Entry.all.order('created_at DESC')
#     @questions = []
#     @question_ids = []
#     @rooms.each do |room|
#       @entries.each do |entry|
#         next unless entry.room_id == room.id
#         if entry.user_id == current_user.id
#           @questions << room
#           @question_ids << room.id
#         end
#       end
#     end
#     @another_question_ids = @rooms.ids - @question_ids
#     @rooms.each do |room|
#       @another_question_ids.each do |another_question_id|
#         @another_questions << room if room.id == another_question_id
#       end
#     end
#   else
#     @another_questions = @rooms
#   end
# end
