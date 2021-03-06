\name{capwords}
\alias{capwords}
\title{Function for converting all caps to mixed case. Useful in data cleaning.}
\description{
The function capwords converts characters to mixed case character as intelligently as possible.
}

\usage{
capwords(x,
	 special.words = c("ELA", "II", "III", "IV", "EMH", "HS", "MS", "ES", "SES", "IEP", "ELL", "MAD", "SD", "US", "SGP"))
}

\arguments{
  \item{x}{A character string to be converted to mixed case.  
  }
  \item{special.words}{A character vector (see default above), specifying words to not convert to mixed case.  
  }
}

\value{Returns a mixed case character string.
}

\author{Damian W. Betebenner \email{dbetebenner@nciea.org}}

\examples{
\dontrun{
capwords("TEST") ## Test
capwords("TEST1 TEST2") ## Test1 Test2
capwords("O'NEIL") ## O'Neil
capwords("JOHN'S") ## John's

## Use sapply for converting character vectors

test.vector <- paste("TEST", 1:10, sep="")
sapply(test.vector, capwords)
}  
}

\keyword{documentation}
