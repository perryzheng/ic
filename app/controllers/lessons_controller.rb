class LessonsController < ApplicationController
  before_filter :authenticate, :only => [:new,  :create, :destroy]
  
  def show
    @lesson = Lesson.find(params[:id])
    @bullet_points = @lesson.bullet_points.paginate(:page => params[:page])
    @title = @lesson.title
  end
  
  def create
    @lesson = Lesson.new(params[:lesson])
    if @lesson.save
      flash[:success] = "Lesson created!"
      redirect_to @lesson
    else
      render 'new'
    end
  end
  
  def new
    @lesson = Lesson.new
    @title = "Create a new lesson"
  end
  
  def edit
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:id])
    if @lesson.update_attributes(params[:lesson])
      flash[:success] = "Lesson updated."
      redirect_to @lesson
    else 
      @title = "Edit Lesson"
      render 'edit'
    end  
  end
  
end
