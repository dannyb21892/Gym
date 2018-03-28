class UsersController < ApplicationController
  # before_filter :authorize


  def downgrade_plan
      @user = User.find(params[:id])
      if params[:user] || params[:commit]
        if params[:user] && params[:user][:lessons]
          @user.unenroll(Lesson.find(params[:user][:lessons]))
        end
        @user.plan = @user.plan.prev_level
        @user.save
        redirect_to @user
        return
      end
    # if params[:loop]
    #   @loop = params[:loop].to_i + 1
    #   if @loop > 5
    #     @user.plan = user.plan.prev_level
    #     redirect_to @user
    #     return
    #   end
    # else
    #   @loop = 1
    #   render :downgrade_plan
    #   return
    # end
    # redirect_to downgrade_path(request.parameters)#controller: "Users", action: "downgrade_plan", loop: @loop+1
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
    @plans = Plan.all
    @lessons = Lesson.all.select{|l| !@user.lessons.include?(l) && !l.full?}
  end

  def create
    @user = User.new(user_params)
    @user.enroll(Lesson.find(params[:user][:lessons]))
    @user.save
    redirect_to @user
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    @lessons = Lesson.all.select{|l| !@user.lessons.include?(l) && !l.full?}
    @plans = @user.plan.higher_plans
  end

  def update
    @user = User.find(params[:id])
    @user.name = params[:user][:name]

    if params[:user][:plan_id] && params[:user][:plan_id] != ""
      @user.plan = Plan.find(params[:user][:plan_id])
    end
    if params[:user][:lessons] && params[:user][:lessons] != ""
      @user.enroll(Lesson.find(params[:user][:lessons]))
    end
    if params[:user][:unenroll_lessons] && params[:user][:unenroll_lessons] != ""
      @user.unenroll(Lesson.find(params[:user][:unenroll_lessons]))
    end
    @user.save
    redirect_to @user
  end

  def delete
    @user = User.find(params[:id])
  end

  def goodbye
    @user = User.find(params[:id])
    @user.destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :plan_id,:password, :password_confirmation, :username)
  end
end
