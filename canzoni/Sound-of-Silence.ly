\version "2.24.1"


\header {
  title = "Sound of Silence"
  composer = "Simon & Garfunkel"
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

%% ascii art tabs
%% https://tabs.ultimate-guitar.com/tab/simon-garfunkel/the-sound-of-silence-chords-863732

