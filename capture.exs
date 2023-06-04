File.mkdir("data")
File.mkdir("data/players")
File.mkdir("data/game_weeks")

bootstrap = Fpl.bootstrap()
File.write("data/bootstrap.json", Jason.encode!(bootstrap))

game_weeks = Fpl.game_weeks()
File.write("data/game_weeks.json", Jason.encode!(game_weeks))

phases = Fpl.phases()
File.write("data/phases.json", Jason.encode!(phases))

teams = Fpl.teams()
File.write("data/teams.json", Jason.encode!(teams))

players = Fpl.players()
File.write("data/players.json", Jason.encode!(players))

fixtures = Fpl.fixtures()
File.write("data/fixtures.json", Jason.encode!(fixtures))

game_weeks
  |> Enum.map(fn gw -> gw["id"] end)
  |> Enum.each(fn gw_id ->
      gw_data = Fpl.game_week_data(gw_id)
      File.write("data/game_weeks/#{gw_id}.json", Jason.encode!(gw_data))
  end)

players
  |> Enum.map(fn pl -> pl["id"] end)
  |> Enum.each(fn pl_id ->
    pl_data = Fpl.player_info(pl_id)
    File.write("data/players/#{pl_id}.json", Jason.encode!(pl_data))
  end)
