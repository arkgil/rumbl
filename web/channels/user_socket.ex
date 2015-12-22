defmodule Rumbl.UserSocket do
  use Phoenix.Socket
  ## Transports
  transport :websocket, Phoenix.Transports.WebSocket
  transport :longpoll, Phoenix.Transports.LongPoll

  ## Channels
  channel "videos:*", Rumbl.VideoChannel


  def connect(%{"token" => token}, socket) do
    case Phoenix.Token.verify(socket, "user socket", token) do
      {:ok, user_id} ->
        user = Rumbl.Repo.get!(Rumbl.User, user_id)
        {:ok, assign(socket, :user_id, user.id)}
      {:error, _reason} ->
        :error
    end
  end

  def connect(_params, _socket), do: :error

  def id(socket), do: "users_socket:#{socket.assigns.user_id}"
end
