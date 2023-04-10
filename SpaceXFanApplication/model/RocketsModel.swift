

import Foundation

// MARK: - RocketModelElement
struct RocketModel: Decodable,Identifiable {
    let id: Int
    let active: Bool
    let stages, boosters, costPerLaunch, successRatePct: Int
    let firstFlight, country, company: String
    let height, diameter: Diameter
    let mass: Mass
    let payloadWeights: [PayloadWeight]
    let firstStage: FirstStage
    let secondStage: SecondStage
    let engines: Engines
    let landingLegs: LandingLegs
    let wikipedia: String
    let rocketModelDescription, rocketID, rocketName, rocketType: String

    enum CodingKeys: String, CodingKey {
        case id, active, stages, boosters
        case costPerLaunch = "cost_per_launch"
        case successRatePct = "success_rate_pct"
        case firstFlight = "first_flight"
        case country, company, height, diameter, mass
        case payloadWeights = "payload_weights"
        case firstStage = "first_stage"
        case secondStage = "second_stage"
        case engines
        case landingLegs = "landing_legs"
        case wikipedia
        case rocketModelDescription = "description"
        case rocketID = "rocket_id"
        case rocketName = "rocket_name"
        case rocketType = "rocket_type"
    }
}

// MARK: - Diameter
struct Diameter: Decodable {
    let meters, feet: Double?
}

// MARK: - Engines
struct Engines: Decodable {
    let number: Int
    let type, version: String
    let layout: String?
    let engineLossMax: Int?
    let propellant1, propellant2: String
    let thrustSeaLevel, thrustVacuum: Thrust
    let thrustToWeight: Double?

    enum CodingKeys: String, CodingKey {
        case number, type, version, layout
        case engineLossMax = "engine_loss_max"
        case propellant1 = "propellant_1"
        case propellant2 = "propellant_2"
        case thrustSeaLevel = "thrust_sea_level"
        case thrustVacuum = "thrust_vacuum"
        case thrustToWeight = "thrust_to_weight"
    }
}

// MARK: - Thrust
struct Thrust: Decodable {
    let kN, lbf: Int
}

// MARK: - FirstStage
struct FirstStage: Decodable {
    let reusable: Bool
    let engines: Int
    let fuelAmountTons: Double
    let burnTimeSEC: Int
    let thrustSeaLevel, thrustVacuum: Thrust
    let cores: Int?

    enum CodingKeys: String, CodingKey {
        case reusable, engines
        case fuelAmountTons = "fuel_amount_tons"
        case burnTimeSEC = "burn_time_sec"
        case thrustSeaLevel = "thrust_sea_level"
        case thrustVacuum = "thrust_vacuum"
        case cores
    }
}

// MARK: - LandingLegs
struct LandingLegs: Decodable {
    let number: Int
    let material: String?
}

// MARK: - Mass
struct Mass: Decodable {
    let kg, lb: Int
}

// MARK: - PayloadWeight
struct PayloadWeight: Decodable {
    let id, name: String
    let kg, lb: Int
}

// MARK: - SecondStage
struct SecondStage: Decodable {
    let engines: Int
    let fuelAmountTons: Double?
    let burnTimeSEC: Int
    let thrust: Thrust
    let payloads: Payloads

    enum CodingKeys: String, CodingKey {
        case engines
        case fuelAmountTons = "fuel_amount_tons"
        case burnTimeSEC = "burn_time_sec"
        case thrust, payloads
    }
}

// MARK: - Payloads
struct Payloads: Decodable {
    let option1: String
    let compositeFairing: CompositeFairing
    let option2: String?

    enum CodingKeys: String, CodingKey {
        case option1 = "option_1"
        case compositeFairing = "composite_fairing"
        case option2 = "option_2"
    }
}

// MARK: - CompositeFairing
struct CompositeFairing: Decodable {
    let height, diameter: Diameter
}

