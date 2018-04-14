# Ripper
Elixir library to handle tcpdump output

### What's Ripper?
Ripper is a simple Elixir library to log HTTP packets using tcpdump.
It's useful when you need to log your requests for forensic monitoring.

### Installation

```elixir
defp deps do
  [{:ripper, "~> 0.1"}]
end
```

### Usage

```elixir
   proc = Ripper.request("80", "my root password")
   data = Ripper.read_pcap(proc)

```

### Author

Farsheed Ashouri / rodmena@me.com



