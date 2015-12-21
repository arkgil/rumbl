defmodule Rumbl.Repo do
  @moduledoc """
    In memory repository
  """

  def all(Rumbl.User) do
    [%Rumbl.User{id: "1", name: "Arek", username: "barcadius", password: "12345678"},
     %Rumbl.User{id: "2", name: "Emi", username: "emikis", password: "12345678"},
     %Rumbl.User{id: "3", name: "Fgt", username: "fgt123", password: "12345678"}]
  end
  def all(_module), do: []

  def get(module, id) do
    Enum.find all(module), fn map -> map.id == id end
  end

  def get_by(module, params) do
    Enum.find all(module), fn map ->
      Enum.all?(params, fn {key, val} -> Map.get(map, key) == val end)
    end
  end
end
