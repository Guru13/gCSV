package by.guru13

class Client {
    String name
    String email
    String street
    String zip

    double latitude
    double longitude

    String toString() { "$name" }

    static constraints = {
        name(blank: false)
        email(unique: true, email: true, blank: false)
        street()
        zip()
        latitude min: -90d, max: 90d
        longitude()
    }
}
