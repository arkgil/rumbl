defmodule Rumbl.UserSocket do
  use Phoenix.Socket
  ## Transports
  transport :websocket, Phoenix.Transports.WebSocket
  transport :longpoll, Phoenix.Transports.LongPoll

  ## Channels
  channel "videos:*", Rumbl.VideoChannel
  
  def connect(_params, socket) do
    {:ok, socket}
  end

  def id(_socket), do: nil
end
