defmodule GlowingGuacamoleWeb.VideoLive do
  use GlowingGuacamoleWeb, :live_view

  def mount(%{"id" => id}, _session, socket) do
    {:ok, assign(socket, id: id)}
  end

  def render(assigns) do
    ~H"""
    <h1>Video Streaming Demo</h1>
    <video width="640" controls>
      <source src={"/videos/#{@id}.mp4"} type="video/mp4" />
      Your browser does not support the video tag.
    </video>
    """
  end
end
