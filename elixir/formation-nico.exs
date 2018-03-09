
defmodule MonMod do

  def test() do
    IO.puts "coucou l emonde"
  end

end

# Les listes
# se sont des listes chaînées en mémoire > accès plus lent aux éléments

list = [ 1, 2, 3 ]

IO.puts list

# Tuples
# les données sont contigues en mémoire > accès plus rapide en mémoire

tpl = {1, 2, :atom}

# Le Pattern matching
# {a, b, c} = {"coucou", "monde"}  # marche pas

# Les Keyword lists
# Les éléments de la liste sont ordonnés
#
kl1 = [ a: 1, b: 2, c: 3]
# ou
kl2 = [{:a, 1}, {:b, 2}, {:c, 3}]

# kl = [ a: 1, b: 2, 3] < Error, il faut que la pair commence par un atom et que ce soit une paire :)
kl3 = [ a: 0, a: 1, b: 2]

# if en one line prend une Keyword list en 2eme argument
if(1, do: 2, else: 3)
if 1, do: 2, else: 3

# Map
# ce n'est pas ordonné

map = %{one: 1, two: 2}
# ou
%{:one => 2}

# update a map
map = %{one: 1, two: 2}
%{ map | one: 3 }

###############################################################################
# Modules & Fonctions

defmodule ModMath do
  def zero?(0), do: true
  def zero?(x) when is_integer(x), do: false
end

# Les structs

defmodule User do
@moduledoc """
  this is the doc of User module
"""
  defstruct name: "Benoit", age: 12

  def show(user) do
    IO.puts user.name
  end
end

# Usage
# user = %User{}
# user |> User.show

# user2 = %User{name: "John", age: 12}

# Process
# pour lancer un process > spawn
parent = self()

p = spawn fn() -> 1 + 2 end
Process.alive? p

# Process liés
# p = spawn_link fn() -> raise "fail" end

###############################################################################
# Task
# Process avec une meilleure gestion d'erreurs

t = Task.start fn() -> 1 + 2 end


###############################################################################
# Création d'un module KV Store

defmodule KV do
  def start() do
    spawn fn -> loop(%{}) end
  end

  def loop(state) do
    IO.puts "looping ..."
    receive do
      {:get, key, caller} ->
        IO.puts "key #{key}"
        send caller, {:ok, key, Map.get(state, key)}
        loop(state)
      {:set, key, value} ->
        IO.puts "setting the key #{key} with the value #{value}"
        state |> Map.put(key, value) |> loop
        {:ok}
    end
  end

end

store = KV.start
send store, {:set, :a, 'bonjour'}
send store, {:get, :a, self()}

# empty all the mailbox
# flush()
