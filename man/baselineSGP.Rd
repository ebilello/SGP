\name{baselineSGP}
\alias{baselineSGP}
\title{Analyze student data to produce student growth percentiles and coefficient matrices from a baseline (i.e. multiple cohort) norm group}
\description{
  Utility function/exemplar used to produce student growth percentiles using long formatted data like that provided by \code{\link{prepareSGP}}. Used as part of \code{\link{analyzeSGP}} for baseline refeenced student growth percentile analyses.
}

\usage{
 baselineSGP(sgp_object,
        state=NULL,
        years=NULL,
        content_areas=NULL,
        grades=NULL,
	sgp.config=NULL,
	sgp.baseline.config=NULL,
	sgp.baseline.panel.years=NULL,
	sgp.percentiles.baseline.max.order=3,
	return.matrices.only=FALSE,
	calculate.baseline.sgps=TRUE,
	goodness.of.fit.print=TRUE,
	...)
}

\arguments{
  \item{sgp_object}{An object of class \code{SGP} containing long formatted data in the \code{Data} (from \code{\link{prepareSGP}}) slot. 
  }
  \item{state}{Acronym indicating state associated with the data for access to embedded knot and boundaries.
  }
  \item{years}{A vector indicating year(s) in which to produce baseline referenced student growth percentiles. 
  }
  \item{content_areas}{A vector indicating content area in which to produce baseline referenced student growth percentiles. 
  }
  \item{grades}{A vector indicating which grades to calculate baseline referenced student growth percentiles. 
  }
  \item{sgp.config}{If \code{years}, \code{content_areas}, and \code{grades} are missing, user can directly specify a list containing three vectors: \code{baseline.content.areas}, \code{baseline.panel.years}, and \code{baseline.grade.sequences}. This advanced option is helpful for analysis of non-traditional grade progressions and other special cases. See \code{\link{analyzeSGP}} for use cases.
  }
  \item{sgp.baseline.config}{A list containing three vectors: \code{sgp.content.areas}, \code{sgp.panel.years}, \code{sgp.grade.sequences} indicating how baseline student growth percentile analyses are to be conducted. In most cases this value will be calculated by default within the function but can be specified directly for advanced use cases. See source code for more detail on this configuration option.
  }
  \item{sgp.baseline.panel.years}{A character vector indicating the years to be used for the calculation of baseline SGPs. Default is to use most recent five years of data.
  }
  \item{sgp.percentiles.baseline.max.order}{Integer indicating the maximum order to calculate baseline student growth percentiles (regardless of maximum coefficient matrix order). Default is 3.
To utilize the maximum matrix order, set to NULL.
  }
  \item{return.matrices.only}{Boolean variable indicating whether the function will only return baseline referenced coefficient matrices. Defaults to FALSE.
  }
  \item{calculate.baseline.sgps}{Boolean variable indicating whether the function will calcualte baseline referenced student growth percentiles from baseline referenced coefficient matrices. Defaults to TRUE.
  }
  \item{goodness.of.fit.print}{Boolean variable indicating whether the function will export goodness of fit plots if baseline referenced student growth percentiles are calculated. Defaults to TRUE.
  }
  \item{...}{Arguments to be passed internally to \code{\link{studentGrowthPercentiles}} for finer control over SGP calculations.
  }
}

\value{If \code{return.matrices.only} is set to TRUE function returns a list containing the baseline referenced coefficient matrices. Otherwise function returns the SGP object provided with the sgp_object argument with the baseline referenced coefficient matrices, growth percentiles, etc. embedded.  
}

\author{Adam Van Iwaarden \email{Vaniwaarden@colorado.edu}, Ben Domingue \email{ben.domingue@gmail.com} and Damian W. Betebenner \email{dbetebenner@nciea.org}}

\seealso{\code{\link{prepareSGP}}, \code{\link{analyzeSGP}}, \code{\link{combineSGP}}}

\examples{
\dontrun{
##  Calculate baseline referenced SGPs (using coefficient matrices embedded in SGPstateData)

Demonstration_SGP <- prepareSGP(sgpData_LONG)
Demonstration_SGP <-  baselineSGP(Demonstration_SGP)


## Calculate baseline referenced coefficient matrices

SGPstateData[["DEMO"]][["Baseline_splineMatrix"]] <- NULL
Demonstration_SGP <- prepareSGP(sgpData_LONG)
DEMO_Baseline_Matrices <- baselineSGP(Demonstration_SGP, return.matrices.only=TRUE, calculate.baseline.sgps=FALSE)


## Calculate baseline referenced coefficient matrices and baseline referenced SGPs with 4 years of data

SGPstateData[["DEMO"]][["Baseline_splineMatrix"]] <- NULL

sgpData_LONG_1011 <- subset(sgpData_LONG, YEAR!="2011_2012")

Demonstration_SGP <- prepareSGP(sgpData_LONG_1011)
Demonstration_SGP <- baselineSGP(Demonstration_SGP)
}  
}

\keyword{documentation}
