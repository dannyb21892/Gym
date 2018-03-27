class LessonsController < ApplicationController
  def index
    params[:open_select] ? is_open = params[:open_select] : is_open = nil
    ["", nil].include?(params[:trainer_select]) ? trainer = Trainer.find(params[:trainer_select]) : trainer = nil
    @lessons = Lesson.all
    if is_open == "1"
      @lessons = @lessons.select{|l| !l.full?}
    end
    if trainer
      @lessons = @lessons.select{|l| l.trainer == trainer}
    end
  end

  def show
    @lesson = Lesson.find(params[:id])
  end
end
