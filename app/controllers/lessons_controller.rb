class LessonsController < ApplicationController
  def show
    @lesson = Lesson.find(params[:id])
    @bullet_points = @lesson.bullet_points.paginate(:page => params[:page])
  end

end
