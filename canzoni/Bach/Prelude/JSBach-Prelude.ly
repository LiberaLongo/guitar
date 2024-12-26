\version "2.24.1"


\header {
  title = "Prelude in C major"
  composer = "J. S. Bach"
  tagline = \markup {
    Engraved at
    \simple #(strftime "%Y-%m-%d" (localtime (current-time)))
    with \with-url #"http://lilypond.org/"
    \line { LilyPond \simple #(lilypond-version) (http://lilypond.org/) }
  }
}
%% color theme from documentation :3
%% https://lilypond.org/doc/v2.24/Documentation/learning/advanced-tweaks-with-scheme
#(define (color-notehead grob)
   "Color the notehead according to its position on the staff."
   (let ((mod-position (modulo (ly:grob-property grob 'staff-position)
                               7)))
     (case mod-position
       ;;   Return rainbow colors
       ((1) (x11-color 'red    ))  ; for C
       ((2) (x11-color 'orange ))  ; for D
       ((3) (x11-color 'yellow ))  ; for E
       ((4) (x11-color 'green  ))  ; for F
       ((5) (x11-color 'blue   ))  ; for G
       ((6) (x11-color 'purple ))  ; for A
       ((0) (x11-color 'violet ))  ; for B
       )))

%% pdf
%% https://musescore.com/valentina/scores/4609406

music = \absolute {
  \override NoteHead.color = #color-notehead
  %%  \time 6/4
  c8 e g c' e' g c' e'
  c e g c' e' g c' e'
  c d a d' f' a d' f'
  c d a d' f' a d' f'
  b, d g d' f' g d' f'		\break
  b, d g d' f' g d' f'
  c e g c' e' g c' e'
  c e g c' e' g c' e'
  c e a e'\2 a' a e'\2 a'
  c e a e'\2 a' a e'\2 a'	\break
  c d fis a d' fis a d'
  c d fis a d' fis a d'
  b, d g d' g' g d' g'
  b, d g d' g' g d' g'
  b, c e g c' e g c'		\break
  b, c e g c' e g c'
  a, c e a c' e a c'
  a, c e a c' e a c'
  fis, a, d a c' d a c'
  fis, a, d a c' d a c'		\break
  g, b, d g b d g b
  g, b, d g b d g b
  g, ais, e g cis' e g cis'
  g, ais, e g cis' e g cis'
  f, a, d a d' d a d'		\break
  f, a, d a d' d a d'
  f, d f gis b f gis b
  f, d f gis b f gis b
  e, c e g c' e g c'
  e, c e g c' e g c'		\break
  e, f a c' f' a c' f'
  e, f a c' f' a c' f'
  d\5 f a c' f' a c' f'
  d\5 f a c' f' a c' f'
  g, d g b f' g b f'		\break
  g, d g b f' g b f'
  c e g c' e' g c' e'
  c e g c' e' g c' e'
  c e ais c' e' ais c' e'
  c e ais c' e' ais c' e'	\break
  f, f a c' e' a c' e'
  f, f a c' e' a c' e'
  fis, c fis a dis' fis a dis'
  fis, c fis a dis' fis a dis' 
  g, b\3 g\4 b\3 dis' g\4 b\3 dis'	\break
  g, b\3 g\4 b\3 dis' g\4 b\3 dis'
  gis, d\5 f c'\3 d' f c'\3 d'
  gis, d\5 f c'\3 d' f c'\3 d'
  g, d\5 f b\3 d' f b\3 d'
  g, d\5 f b\3 d' f b\3 d'	\break
  g, e g c' e' g c' e'
  g, e g c' e' g c' e'
  g, d g c' f' g c' f'
  g, d g c' f' g c' f'
  g, d g b f' g b f'		\break
  g, d g b f' g b f'
  g, dis a c' fis' a c' fis'
  g, dis a c' fis' a c' fis'
  g, e g c' g' g c' g'
  g, e g c' g' g c' g'		\break
  g, d g c' f' g c' f'
  g, d g c' f' g c' f'
  g, d g b f' g b f'
  g, d g b f' g b f'
  c e ais c' e' ais c' e'	\break
  c e ais c' e' ais c' e'
  c a f a c' f' c' a
  c' a f a f d f d
  c b g b d' f' d' b
  d' b g b a, c b, a,
  <c e g c'>
}

\score {
  <<
    \new StaffGroup = "tab with traditional" <<
      \new Staff = "guitar traditional" <<
        \clef "treble_8"
        \music
      >>
      \new TabStaff = "guitar tab" <<
        \music
      >>
    >>
  >>
}
