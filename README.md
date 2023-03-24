# Wordstats

This is a very unoptimized, horrible, barely useful script that returns a bunch of stats from a text file.

I made it because I needed something quick for a blog article. So do not expect a lot from it.

## Usage

Compile

```sh
ghc wordstats.hs
```

Run

```sh
wordstats example.txt
```

Read the output

```text
parola                  |        2 |   16.667‰
stupido                 |        2 |   16.667‰
altro                   |        1 |    8.333‰
comunue                 |        1 |    8.333‰
file                    |        1 |    8.333‰
poco                    |        1 |    8.333‰
qualche                 |        1 |    8.333‰
questo                  |        1 |    8.333‰

Total Words:        12
Total Unique Words: 9
```

That's it.
