import 'package:movie_evertec/data/models/models.dart';

final movieListJson = {
  "page": 1,
  "results": [
    {
      "adult": false,
      "backdrop_path": "/79bJL9ydAMYVltuNTt4VhxORqIz.jpg",
      "genre_ids": [12, 878],
      "id": 329,
      "original_language": "en",
      "original_title": "Jurassic Park",
      "overview":
          "El multimillonario John Hammond tiene una idea para un espectacular parque temático: una isla retirada donde los visitantes puedan observar dinosaurios reales. Con la última tecnología en el desarrollo de ADN, los científicos pueden clonar braquiosaurios, triceratops, velociraptors y un tiranosaurio rex, utilizando para ello la sangre fosilizada en ámbar contenida en insectos que los mordieron hace millones de años. Los paleontólogos Alan Grant, Ellie Sattler y Ian Malcolm visitan el parque y quedan muy sorprendidos con los resultados obtenidos. Pero cuando un problemático empleado manipula el sofisticado sistema de seguridad los dinosaurios escapan, obligando a los visitantes a luchar por su supervivencia.",
      "popularity": 26.991,
      "poster_path": "/1r8TWaAExHbFRzyqT3Vcbq1XZQb.jpg",
      "release_date": "1993-06-11",
      "title": "Jurassic Park (Parque Jurásico)",
      "video": false,
      "vote_average": 7.941,
      "vote_count": 15213
    },
    {
      "adult": false,
      "backdrop_path": "/gzppdxEJ6fofhtLzSVSUJZEVxvq.jpg",
      "genre_ids": [28, 878, 53],
      "id": 848278,
      "original_language": "en",
      "original_title": "Jurassic Hunt",
      "overview":
          "Tras la explosión de una mina, los dinosaurios emergen de los escombros y aterrorizan un pueblo del Lejano Oeste; muchos pistoleros unen fuerzas para defender sus hogares y al resto de los residentes de las bestias hambrientas.",
      "popularity": 23.103,
      "poster_path": "/qhWkxLGzc5J7j3neP0I3XYTdMWT.jpg",
      "release_date": "2021-08-26",
      "title": "Cacería Jurásica",
      "video": false,
      "vote_average": 5.1,
      "vote_count": 214
    }
  ],
  "total_pages": 2,
  "total_results": 25,
};

final movieListModel = [
  MovieModel.fromJson(
    {
      "adult": false,
      "backdrop_path": "/79bJL9ydAMYVltuNTt4VhxORqIz.jpg",
      "genre_ids": [12, 878],
      "id": 329,
      "original_language": "en",
      "original_title": "Jurassic Park",
      "overview":
          "El multimillonario John Hammond tiene una idea para un espectacular parque temático: una isla retirada donde los visitantes puedan observar dinosaurios reales. Con la última tecnología en el desarrollo de ADN, los científicos pueden clonar braquiosaurios, triceratops, velociraptors y un tiranosaurio rex, utilizando para ello la sangre fosilizada en ámbar contenida en insectos que los mordieron hace millones de años. Los paleontólogos Alan Grant, Ellie Sattler y Ian Malcolm visitan el parque y quedan muy sorprendidos con los resultados obtenidos. Pero cuando un problemático empleado manipula el sofisticado sistema de seguridad los dinosaurios escapan, obligando a los visitantes a luchar por su supervivencia.",
      "popularity": 26.991,
      "poster_path": "/1r8TWaAExHbFRzyqT3Vcbq1XZQb.jpg",
      "release_date": "1993-06-11",
      "title": "Jurassic Park (Parque Jurásico)",
      "video": false,
      "vote_average": 7.941,
      "vote_count": 15213
    },
  ),
  MovieModel.fromJson(
    {
      "adult": false,
      "backdrop_path": "/gzppdxEJ6fofhtLzSVSUJZEVxvq.jpg",
      "genre_ids": [28, 878, 53],
      "id": 848278,
      "original_language": "en",
      "original_title": "Jurassic Hunt",
      "overview":
          "Tras la explosión de una mina, los dinosaurios emergen de los escombros y aterrorizan un pueblo del Lejano Oeste; muchos pistoleros unen fuerzas para defender sus hogares y al resto de los residentes de las bestias hambrientas.",
      "popularity": 23.103,
      "poster_path": "/qhWkxLGzc5J7j3neP0I3XYTdMWT.jpg",
      "release_date": "2021-08-26",
      "title": "Cacería Jurásica",
      "video": false,
      "vote_average": 5.1,
      "vote_count": 214
    },
  ),
];
