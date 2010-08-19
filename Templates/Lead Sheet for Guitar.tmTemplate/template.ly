% Lilypond Template
%    For guitar/banjo/chordal instrument lead sheet creation
% 
% Author: Dean Radcliffe
% Parts: Chord instrument, 
% Parameters: midi instrument, transposition options, unindenting first line, midi tempo, clef/key/time sig, ...
\header{
	composer          = "${TM_FULLNAME}"
	title             = "${TM_NEW_FILE_BASENAME}"

	copyright         = ""
	maintainer        = "${TM_FULLNAME}"
	lastupdated       = "${TM_DATE}"
}

\version "${TM_LILY_VERSION}"

\paper { 
   indent = 0\cm
}

myChords = \chordmode {   
  \repeat volta 2{ 
    g1   c1 
    d1.
    g1 
  }
  d1.
  g1
}

myStrum = \repeat unfold 14 \relative c''{ g8 g8 r16 g16 g16 g16 }
myStrumTips = {s8 \downbow s8. \downbow s16 \upbow s16 \downbow s16 \upbow }

%% The primary score first - the midi-only score follows it
\score {
  <<
    \new ChordNames { \set chordChanges = ##t \myChords }
    \new Staff \with {
      %% Uncomment the following to automatically tie notes
      %%\remove "Note_heads_engraver"
      %%\consists "Completion_heads_engraver"
    }{ 
      \time 2/4
      \tempo 4 = 132
      \set beatLength = #(ly:make-moment 1 4)  % beam quarter notes
      \improvisationOn 
      <<  \myStrum \myStrumTips >>
    }
  >>
  \layout{}
}

\smaller 
 \markup{ \column { 
 "Chorus:"
 ""
 ""
 ""
 ""
 ""  } } % end of chorus
 
 \markup {
 \column {
 
 \hspace #2.0
  "---"
  "   ---" 
  "---"
  "   ---" 
  "---"
  "   ---" 
  "---"
  "   ---" 

 \hspace #1.0
 "<Chorus>"
 
 \hspace #2.0
  "---"
  "   ---" 
  "---"
  "   ---" 
  "---"
  "   ---" 
  "---"
  "   ---" 

 \hspace #1.0
 "<Solo>"
 
 }
 \column {
 \hspace #2.0
  \italic{ "(Quieter)" }
  "---"
  "   ---" 
  "---"
  "   ---" 
  "---"
  "   ---" 
  "---"
  "   ---" 

 \hspace #1.0
 "<Chorus>"
 }
 \column {
   \hspace #2.0
 	"Arrgmt:"
	"  Intro Riff"
  	"  Chorus"
	  "  V1"
  	"  Chorus"
	"  V2" 
	"  Solo"
	"  V3 (quieter)"
	"  Chorus"
	"  Outro Riff"
  }
}

%% The midi-only score, in order to unfold repeats
\score {
  \new Staff="chords in Bb" {
  	\set Staff.midiInstrument = #"banjo"
    \unfoldRepeats
    \transpose g' bes \myChords
  }
  \midi{}
}