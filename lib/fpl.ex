require HTTPoison

defmodule Fpl do
  @moduledoc """
  A library to read data from the Fantasy Premier League API
  """

  @host "https://fantasy.premierleague.com"

  def bootstrap() do
    req("/api/bootstrap-static/")
  end

  def fixtures() do
    req("/api/fixtures/")
  end

  def game_weeks() do
    bootstrap()["events"]
  end

  def phases() do
    bootstrap()["phases"]
  end

  def teams() do
    bootstrap()["teams"]
  end

  def players() do
    bootstrap()["elements"]
  end

  def player_info(id) do
    req("/api/element-summary/#{to_string(id)}/")
  end

  def game_week_data(gw_id) do
    req("/api/event/#{to_string(gw_id)}/live/")
  end

  defp req(url) do
    response = HTTPoison.get!(@host <> url)
    Jason.decode!(response.body)
  end

end
