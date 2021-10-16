import 'package:equatable/equatable.dart';

class Flashcard extends Equatable {
  final String photopath;
  final String letter;

  const Flashcard({required this.photopath, required this.letter});
  @override
  // TODO: implement props
  List<Object?> get props => [photopath, letter];

  static List<Flashcard> alphabets = [
    Flashcard(photopath: "assets/images/rabbid_a.png", letter: "a"),
    Flashcard(photopath: "assets/images/rabbid_r.png", letter: "r"),
    Flashcard(photopath: "assets/images/rabbid_b.png", letter: "b"),
    Flashcard(photopath: "assets/images/funfact_1.png", letter: "1"),
    Flashcard(photopath: "assets/images/rabbid_n.png", letter: "n"),
    Flashcard(photopath: "assets/images/rabbid_o.png", letter: "o"),
    Flashcard(photopath: "assets/images/funfact_2.png", letter: "2"),
    Flashcard(photopath: "assets/images/rabbid_e.png", letter: "e"),
    Flashcard(photopath: "assets/images/rabbid_f.png", letter: "f"),
    Flashcard(photopath: "assets/images/rabbid_g.png", letter: "g"),
    Flashcard(photopath: "assets/images/rabbid_h.png", letter: "h"),
    Flashcard(photopath: "assets/images/rabbid_c.png", letter: "c"),
    Flashcard(photopath: "assets/images/rabbid_d.png", letter: "d"),
    Flashcard(photopath: "assets/images/rabbid_i.png", letter: "i"),
    Flashcard(photopath: "assets/images/rabbid_x.png", letter: "x"),
    Flashcard(photopath: "assets/images/rabbid_j.png", letter: "j"),
    Flashcard(photopath: "assets/images/rabbid_m.png", letter: "m"),
    Flashcard(photopath: "assets/images/rabbid_p.png", letter: "p"),
    Flashcard(photopath: "assets/images/rabbid_q.png", letter: "q"),
    Flashcard(photopath: "assets/images/rabbid_s.png", letter: "s"),
    Flashcard(photopath: "assets/images/rabbid_t.png", letter: "t"),
    Flashcard(photopath: "assets/images/rabbid_v.png", letter: "v"),
    Flashcard(photopath: "assets/images/rabbid_l.png", letter: "l"),
    Flashcard(photopath: "assets/images/rabbid_w.png", letter: "w"),
    Flashcard(photopath: "assets/images/rabbid_y.png", letter: "y"),
    Flashcard(photopath: "assets/images/rabbid_u.png", letter: "u"),
    Flashcard(photopath: "assets/images/rabbid_z.png", letter: "z"),
    Flashcard(photopath: "assets/images/rabbid_k.png", letter: "k"),
  ];
}
