% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/info_add.R
\name{info_columns}
\alias{info_columns}
\title{Add information that focuses on aspects of a data table's columns}
\usage{
info_columns(x, columns, ..., .add = TRUE)
}
\arguments{
\item{x}{An informant object of class \code{ptblank_informant}.}

\item{columns}{The column or set of columns to focus on. Can be defined as a
column name in quotes (e.g., \code{"<column_name>"}), one or more column names
in \code{vars()} (e.g., \verb{vars(<column_name>)}), or with a select helper (e.g.,
\code{starts_with("date")}).}

\item{...}{Information entries as a series of named arguments.}

\item{.add}{Should new text be added to existing text? This is \code{TRUE} by
default; setting to \code{FALSE} replaces any existing text for a property.}
}
\value{
A \code{ptblank_informant} object.
}
\description{
Upon creation of an \emph{informant} object (with the \code{\link[=create_informant]{create_informant()}}
function), there are two sections containing properties: (1) 'table' and (2)
'columns'. The 'columns' section is initialized with the table's column names
and their types (as \verb{_type}). Beyond that, it is useful to provide details
about the nature of each column and we can do that with the \code{info_columns()}
function. A single column (or multiple columns) is targeted, and then a
series of named arguments (in the form
\code{entry_name = "The information."}) serves as additional
information for the column or columns.
}
\section{Figures}{

\if{html}{\figure{man_info_columns_1.png}{options: width=100\%}}
}

\section{Function ID}{

3-2
}

\examples{
# Create a pointblank `informant`
# object with `create_informant()`;
# we specify a `read_fn` with the
# `~` followed by a statement that
# gets the `small_table` dataset
informant <- 
  create_informant(
    read_fn = ~ small_table,
    tbl_name = "small_table",
    label = "An example."
  )

# The `informant` object has the 'table'
# and 'columns' sections; we can add more
# properties to individual columns in
# the 'columns' section
informant <-
  informant \%>\%
  info_columns(
    columns = vars(a),
    info = "In the range of 1 to 10. (SIMPLE)"
  ) \%>\%
  info_columns(
    columns = starts_with("date"),
    info = "Time-based values (e.g., `Sys.time()`)."
  ) \%>\%
  info_columns(
    columns = "date",
    info = "The date part of `date_time`. (CALC)"
  )

# Upon printing the `informant` object, we see
# the additions made to the 'Columns' section

# The `informant` object can be written to
# a YAML file with the `yaml_write()`
# function; then, information can
# be directly edited or modified
# yaml_write(
#   informant = informant,
#   filename = "informant.yml"
# )

# The YAML file can then be read back
# into an informant object with the
# `yaml_read_informant()` function
# informant <-
#   yaml_read_informant(path = "informant.yml")

}
\seealso{
Other Information Functions: 
\code{\link{info_section}()},
\code{\link{info_snippet}()},
\code{\link{info_tabular}()}
}
\concept{Information Functions}
