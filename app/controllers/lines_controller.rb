class LinesController < ApplicationController
  def index
    @lines = Line.all
  end

  def show
    @lines = []
    line = params[:id].nil? ? Line.order("RANDOM()").first : Line.find(params[:id])
    
    if line.nil?
      redirect_to new_line_path
    else
      @lines << line
  
      @line = Line.new(parent_id: line.id)
  
      while !line.parent_id.nil? && line.parent_id > 0
        line = Line.find(line.parent_id)
        @lines.unshift(line)
      end
    end
  end

  def new
    @line = Line.new
  end
  
  def create
    @line = Line.new(params.require(:line).permit(:parent_id, :text))
    
    if @line.save
      redirect_to @line
    else
      render 'new'
    end
  end
end
