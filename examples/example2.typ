#let data = toml("ex2.1.toml")

The following races are in the list:
#for race in data.races  [
- #race.name @race.label
]

#for race in data.races  [
#figure(
    image(width: 2cm, race.image),
    caption: race.name
)<#race.label>
]