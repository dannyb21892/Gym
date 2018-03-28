class LessonsController < ApplicationController
  def index
    params[:open_select] ? @is_open = params[:open_select] : @is_open = nil
    params[:lesson] && params[:lesson][:trainer_select] != "" ? @trainer = Trainer.find(params[:lesson][:trainer_select].to_i) : @trainer = nil
    @lessons = Lesson.all
    if @is_open == "1"
      @lessons = @lessons.select{|l| !l.full?}
    end
    if @trainer
      @lessons = @lessons.select{|l| l.trainer == @trainer}
    end
    # if trainer
    #   @lessons = @lessons.select{|l| l.trainer == trainer}
    # end
  end

  def show
    @lesson = Lesson.find(params[:id])
  end
end
