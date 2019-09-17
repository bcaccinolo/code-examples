class Tevye

  def live
    sunrise
    sunset
    l_chaim!
    toil_in_anatevka
    :pauper
  end

  def rich_man?
    false
  end

private

  def method_missing(method, *args)
    nil
  end

  def toil_in_anatevka
    if self.rich_man?
      throw :miracle_of_miracles,
            'Emigrated to the Cayman Islands'
    end
  end

end


require 'pry'; binding.pry # 🚧 🚜


poor_tevye = Tevye.new
result = catch(:miracle_of_miracles) do
  poor_tevye.live
end

