module ApplicationHelper
  def titulo
    if @desc_tit.nil?
      @desc_tit = "Microposts"
    else
      @desc_tit = @desc_tit + " - Microposts"
    end
  end
end
