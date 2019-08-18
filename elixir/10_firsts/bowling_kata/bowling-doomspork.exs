
defmodule Bowling do
  def score(rolls), do: calculate(1, rolls)

  def calculate(i, _list) when i > 10, do: 0
  def calculate(i, list) do
    case calculate_frame_score(list) do
      {:strike, score} -> score + calculate(i+1, Enum.slice(list, 1, 20))
      {:spare , score} -> score + calculate(i+1, Enum.slice(list, 2, 20))
      {:normal, score} -> score + calculate(i+1, Enum.slice(list, 2, 20))
    end
  end

  def calculate_frame_score([10|_] = rolls), do: strike(rolls)
  def calculate_frame_score([f1, f2 |_] = rolls) when f1 + f2 == 10, do: spare(rolls)
  def calculate_frame_score(rolls), do: normal(rolls)

  def calculate_frame_score([10|_] = rolls), do: strike(rolls)

  def strike(list), do: {:strike, slice_and_dice(list)}

  def spare(list), do: {:spare, slice_and_dice(list)}

  def normal(list), do: {:normal, slice_and_dice(list, 0..1)}

  defp slice_and_dice(list, range \\ 0..2) do
    list
    |> Enum.slice(range)
    |> Enum.reduce(&(&1 + &2))
  end
end