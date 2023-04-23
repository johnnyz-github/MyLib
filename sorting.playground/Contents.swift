class Movie {
    let name: String
    var date: Int?
    
    init(_ name: String) {
        self.name = name
    }
}

var movieA = Movie("A")
var movieB = Movie("B")
var movieC = Movie("C")

let movies = [movieB, movieC, movieA]
let sortedMovies = movies.sorted { $0.name > $1.name }
sortedMovies
