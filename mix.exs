defmodule PKCS7.Mixfile do
  use Mix.Project

  def project do
    [app: :pkcs7,
     version: "1.0.2",
     elixir: "~> 1.0",
     description: "PKCS7 binary padding for erlang",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     package: package(),
     deps: deps()]
  end

  def application do
    [applications: []]
  end

  defp deps do
    [{:excheck, "~> 0.2.3", only: [:dev, :test]},
     {:triq, github: "krestenkrab/triq", only: [:dev, :test]}]
  end

  defp package do
    [files: ["lib", "src", "mix.exs", "README*"],
     contributors: ["Cameron Bytheway"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/camshaft/pkcs7.erl"}]
  end
end
