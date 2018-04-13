defmodule Ripper.MixProject do
  use Mix.Project

  def project do
    [
      app: :ripper,
      version: "0.1.1",
      elixir: "~> 1.6",
        build_embedded: Mix.env == :prod,
        start_permanent: Mix.env == :prod,
        description: description(),
        package: package(),
        name: "Ripper",
        source_url: "https://github.com/ourway/ripper",
      deps: deps()
    ]

  end


  defp package do
    # These are the default files included in the package
    [
      name: :ripper,
      files: ["lib", "mix.exs", "README*", "config", "test"],
      maintainers: ["Farsheed Ashouri"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/ourway/ripper"}
    ]
  end






  defp description do
        """
          Ripper is a elixir library to monitor network activity using tcpdump.
          Ripper needs tcpdump to function.
          It's not ready to use yet
        """
      end



  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :porcelain],
      mod: {Ripper.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:porcelain, "~> 2.0"}

      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end
end
