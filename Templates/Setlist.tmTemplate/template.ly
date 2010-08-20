\header{
	filename = "${TM_NEW_FILE_BASENAME}.ly"
	composer          = "${TM_FULLNAME}"
	title             = "${TM_NEW_FILE_BASENAME}"

	copyright         = "Creative Commons Attribution-ShareAlike 2.5"
	maintainer        = "${TM_FULLNAME}"
	lastupdated       = "${TM_DATE}"
}

\version "2.12.3"

\markup{ \column{
	\fontsize #10 { 
	\line { 1. (A)  Foo  }      \hspace #10
	\line { 2. (E)  Foo  }      \hspace #10
	\line { 3. (Bb) Foo  }      \hspace #10
	\line { 4.      Foo  }      \hspace #10
	\line { 5.      Foo  }      \hspace #10
	\line { 6.      Foo  }      \hspace #10
	\line { 7.      Foo  }      \hspace #10
	}
	\line \bold { Finale ! }
}}