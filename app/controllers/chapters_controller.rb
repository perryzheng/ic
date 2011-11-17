class ChaptersController < ApplicationController
  before_filter :authenticate, :only => [:new,  :create, :destroy, :index, :show]
   
  def index
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

  end

  def show
    @chapter = Chapter.find(params[:id])
    @lessons = @chapter.lessons.paginate(:page => params[:page])
    @title = @chapter.title
  end

end
