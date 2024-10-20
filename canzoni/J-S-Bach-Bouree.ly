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
%% a free pdf
%% https://www.thisisclassicalguitar.com/wp-content/uploads/2019/04/Bach-Bourree-BWV996-Free.pdf
%% ascii art tabs
%% https://tabs.ultimate-guitar.com/tab/189037

upper = \relative c' {
  \time 12/8
  \key e \minor
  \voiceOne
  e8 fis 
  \repeat volta 2 {
    g4 fis8 e dis4 e8 fis b,4 cis8 dis e4 d8 c b4 a8 g fis4 g8 a 
    b a g fis e4 e'8 fis g4 fis8 e
  }
}

lower = \relative c {
  \key e \minor
  \voiceTwo
  g8 fis
  \repeat volta 2 {
    e4 a b a g fis e fis g a b a
    g b e,8 fis g fis e4 a
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