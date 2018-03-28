class TrainersController < ApplicationController
  def index
    @trainers = Trainer.all
  end

  def show
    @trainer=Trainer.find(params[:id])
    @image = @trainer.name.downcase.split(" ").join("-") << ".jpg"
    STDERR.puts "****************#{@image}"
  end
end
