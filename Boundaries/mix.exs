defmodule BoundariesExample.Cli.MixProject do
  use Mix.Project

  def project do
    [
      app: :boundariesexample,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases(),
      escript: escript(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test,
        "coveralls.lcov": :test,
        ctest: :test,
        itest: :test
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {BoundariesExample.Cli.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:boundary, "~> 0.8.0", runtime: false},
      {:dialyxir, "~> 1.0", only: [:dev, :test], runtime: false},
      {:credo, "~> 1.5.4", only: [:dev, :test], runtime: false},
      {:excoveralls, "~> 0.10", only: [:test]},
      {:lcov_ex, "~> 0.2", only: [:dev, :test], runtime: false}
    ]
  end

  defp aliases do
    [
      setup: ["deps.get", "cmd npm install --prefix assets"],
      c: [
        "deps.clean --unused",
        "deps.update --all",
        "format",
        "compile --force --warnings-as-errors",
        "credo --strict",
        "dialyzer"
      ],
      test: [
        "test --force --cover"
      ]
    ]
  end

  defp escript do
    [main_module: BoundariesExample.Cli]
  end
end
