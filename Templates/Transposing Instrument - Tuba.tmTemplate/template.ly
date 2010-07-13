\header{
	filename = "${TM_NEW_FILE_BASENAME}.ly"
	composer          = "${TM_FULLNAME}"
	title             = "${TM_NEW_FILE_BASENAME}"

	copyright         = "Creative Commons Attribution-ShareAlike 2.5"
	maintainer        = "${TM_FULLNAME}"
	lastupdated       = "${TM_DATE}"
}

\version "${TM_LILY_VERSION}"


theme = \relative c, {
	c16-. r8.      g'16-. r8.    d16-. r8  g,8. b8
}

\score {
	\new Staff = "tuba" {
		% See here for a list of valid instrument names:
		% http://lilypond.org/doc/v2.12/input/lsr/lilypond-snippets/MIDI#Demo-MidiInstruments
		\set Staff.midiInstrument = #"tuba"

		\clef bass
		\time 4/4

		\transpose c' ees'{ 
			\key c \major
			\repeat percent 2 { 
				\theme
			}
		}
	}
	\layout { }
	\midi { 
		\context { 
			\Score tempoWholesPerMinute = #(ly:make-moment 95 4)
		}
  }
}