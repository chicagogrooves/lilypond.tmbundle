% Lilypond Template
%    For monophonic (possibly transposing) instrument-  woodwind, violin, etc..
% 
% Author: Dean Radcliffe
%
% Parameters: midi instrument, transposition options (c' to c' is no transpose at all)
%             midi tempo, clef/key/time sig, ...
\header{
	composer          = "${TM_FULLNAME}"
	title             = "${TM_NEW_FILE_BASENAME}"

	copyright         = ""
	maintainer        = "${TM_FULLNAME}"
	lastupdated       = "${TM_DATE}"
}

\version "${TM_LILY_VERSION}"

% This theme is written in c, intended to be played in Eb
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
		
		% Here we display the music in the key of its fingerings, so we can recreate it
    \key c \major
	  \repeat percent 2 { 
		  \theme
    }

	}
	\layout { }
	\midi { 
	  \context { 
	    \Score tempoWholesPerMinute = #(ly:make-moment 95 4)
	  }
    % Here we transpose the fingered pitches into the sounding ones for the instrument
    \transpose c' ees'{ 
		}
	}
}