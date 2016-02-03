module AvailableTimesHelper

  def can_they_work2(time)
    if time == "1"
      raw("<i class='fa fa-check-circle fa-2x' style='color:#27e127'></i>")
    else time == "2"
      raw("<i class='fa fa-times-circle fa-2x' style='color:#e12727'></i>")
    end
  end

end

