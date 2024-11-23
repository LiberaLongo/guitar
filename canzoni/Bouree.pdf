\version "2.24.1"


\header {
  title = "Bouree"
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

%% a free pdf
%% https://www.thisisclassicalguitar.com/wp-content/uploads/2019/04/Bach-Bourree-BWV996-Free.pdf
%% ascii art tabs
%% https://tabs.ultimate-guitar.com/tab/189037

upper = \absolute {
  \override NoteHead.color = #color-notehead
  %%  \time 6/4
  \key e \minor
  \voiceOne
  \repeat volta 2 {
    e'8 fis'
    g'4 fis'8 e' dis'4 e'8 fis' b4 cis'8 dis' e'4
    d'8 c' b4 a8 g fis4 g8 a b a g fis e4 \break
    e'8 fis' g'4 fis'8 e' dis'4 e'8 fis' b4 cis'8 dis' e'4
    d'8 c' b4 a8 g fis4-. r8 g\4 g2-. \break
  }
  \repeat volta 2 {
    b8 g
    d'4 a8 c' b4 g'8 d' e'4 b8\3 d' c'4 b8\3 a
    gis4 a8 b c'4 b8 a a2-. r4 d'8 a b4 g'8 d' e'4 b8\3 d' \break
    c'4 a'8 e'\2 fis'4 cis'8 e' d'4 cis'8 b b16\3 ais b\3 ais b\3 ais b8
    b2-. r4 b'8 fis'\2 gis'4\2 fis'8\2 e'\2 a'4 e'8\2 g' fis'4 e'8 d' g'4 d'8 f' \break
    e'4 a'8 e' fis'4 cis'8 e' dis'4 b2\3 e'8 b c'4 d'8 a b4 c'8 g
    a4 b8 fis g4 fis8 e dis4 e8 fis g4 fis8 e e2
  }
  
}

lower = \absolute {
  \override NoteHead.color = #color-notehead
  \key e \minor
  \voiceTwo
  
  \repeat volta 2 {
    g,8 fis,
    e,4 a, b, a, g, fis, e,
    fis, g, a, b, a, g, b, e,8 fis,
    g, fis, e,4 a, b, a, g, fis, e,
    fis, g, c d\5 d\5 <d, b, g,>2-.
  }
  \repeat volta 2 {
    g,4 fis, d g, b, c gis, a, d
    e a, e e, a,8 c a, g, fis,4 d g, b, c gis,
    g, cis d ais, b, e fis fis,
    b,8 ais, b, cis dis4 b,\6 e\5 d\5 cis a,\6 d c b, g,
    c b, a, fis, b,-. r8 c8 b, a, gis,4 a,8 e fis4 g8 dis e4
    fis8 cis dis4\5 e a, b, a,2 r4 e,2
  }
}

\score {
  <<
    \new StaffGroup = "tab with traditional" <<
      \new Staff = "guitar traditional" <<
        \clef "treble_8"
        \new Voice = "upper" \upper
        \new Voice = "lower" \lower
      >>
      \new TabStaff = "guitar tab" <<
        \new TabVoice = "upper" \upper
        \new TabVoice = "lower" \lower
      >>
    >>
  >>
}