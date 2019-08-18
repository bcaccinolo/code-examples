defmodule Pmap.Function do
  # the method launched in the process
  def send_square dest, n do
    send(dest, {:ok, self(), n * n})
  end

end




