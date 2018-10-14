//: Playground - noun: a place where people can play

import UIKit

// Functional chaining

let london = (name: "London", continent: "Europe", population: 8_539_000)
let paris = (name: "Paris", continent: "Europe", population: 2_244_000)
let lisbon = (name: "Lisbon", continent: "Europe", population: 530_000)
let rome = (name: "Rome", continent: "Europe", population: 2_627_000)
let tokio = (name: "London", continent: "Asia", population: 13_350_000)

let cities = [london, paris, lisbon, rome, tokio]

let totalPopulation = cities.reduce(0) { $0 + $1.population }
totalPopulation

// Sum up the Europe population using filter and reduce.
let europePopulation = cities.filter { $0.continent == "Europe" }.reduce(0) { $0 + $1.population }
europePopulation

let biggestCities = cities.filter {
        $0.population > 2_000_000
    }.sorted {
        $0.population > $1.population
    }.prefix(upTo: 4).map {
        "\($0.name) is a big city, with a population of \($0.population)"
    }.joined(separator: "\n")
print(biggestCities)

