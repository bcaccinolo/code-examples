
defmodule Bowling do

    def score rolls do
       calculate 1, rolls
    end
    
    def calculate i, list do
        if i > 10 do
            0
        else
             case calculate_frame_score(list) do
                {:strike, score} -> score + calculate(i+1, Enum.slice(list, 1, 20))
                {:spare , score} -> score + calculate(i+1, Enum.slice(list, 2, 20))
                {:normal, score} -> score + calculate(i+1, Enum.slice(list, 2, 20))
            end        
        end
    end

    def calculate_frame_score rolls_list do
        case rolls_list do
          [10 | _ ]                       -> strike rolls_list
          [f1, f2 | _] when f1 + f2 == 10 -> spare rolls_list
          [f1, f2 | _] when f1 + f2 < 10  -> normal rolls_list
          _ -> 0
        end
    end

    def strike list do
        {:strike, Enum.slice(list, 0..2) |> Enum.reduce(fn(x, acc) -> x + acc end)} 
    end

    def spare list do 
        {:spare, Enum.slice(list, 0..2) |> Enum.reduce(fn(x, acc) -> x + acc end)}
    end

    def normal list do
        {:normal, Enum.slice(list, 0..1) |> Enum.reduce(fn(x, acc) -> x + acc end)}
    end

end


full_strikes = [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10]
spares = [9, 1, 9, 1, 9, 1, 9, 1, 9, 1, 9, 1, 9, 1, 9, 1, 9, 1, 9, 1, 9 ]
spares2 = [5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5]
nines_list = [9, 0, 9, 0, 9, 0, 9, 0, 9, 0, 9, 0, 9, 0, 9, 0, 9, 0, 9, 0]

IO.puts Bowling.score full_strikes
IO.puts Bowling.score spares
IO.puts Bowling.score spares2
IO.puts Bowling.score nines_list