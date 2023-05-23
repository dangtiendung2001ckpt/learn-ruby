class UsersController < ApplicationController
  def index
    @users = User.all
    render :index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    data = user_params.permit(:name, :email, :password)
    # return render :json => data


    if @user.update(data)
      redirect_to users_path
    else
      render :edit
    end
  end

  def show
    @user = User.find_by_id(params[:id])

=begin
    return render :json => @user
=end
    if @user.present?

      return render :show
    end

    redirect_to users_path
  end

  def destroy
    @user = User.find_by_id(params[:id])
    if @user.present?
      @user.destroy
      flash[:notice] = "Xóa user thành công"
    else
      flash[:alert] = "User không tồn tại"
    end
    redirect_to users_path
  end



  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
