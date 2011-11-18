class ChaptersController < ApplicationController
  before_filter :authenticate, :only => [:new,  :create, :destroy, :index, :show]
   
  def index
    @title = "All Chapters"
    @chapters = Chapter.paginate(:page => params[:page])
  end

  def new
    @chapter = Chapter.new
    @title = "Create a new Chapter"
    1.times do
      lesson = @chapter.lessons.build
      bullet_point = lesson.bullet_points.build
      1.times { bullet_point.bible_verses.build }
    end
  end

  def edit
    @chapter = Chapter.find(params[:id])
  end

  def show
    @chapter = Chapter.find(params[:id])
    @lessons = @chapter.lessons.paginate(:page => params[:page])
    @title = @chapter.title
  end
  
  def create
    @chapter = Chapter.new(params[:chapter])
    if @chapter.save
      flash[:success] = "Chapter created!"
      redirect_to @chapter
    else
      render 'new'
    end
  end
  
  def update
    @chapter = Chapter.find(params[:id])
    if @chapter.update_attributes(params[:chapter])
      flash[:success] = "Chapter updated."
      redirect_to @chapter
    else
      @title = "Edit chapter"
      render 'edit'
    end
  end
  
end
