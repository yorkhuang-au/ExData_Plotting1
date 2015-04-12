

###
### Function to plot plot1
###
plot1 <- function(filename) {
  lines <- readLines(filename)
  want <- grepl("^[12]/2/2007.*", lines)
  want[1] <- TRUE
  
  data <- read.table(textConnection(lines[want]), sep=";", header=TRUE, 
                     na.strings="?")
  png("plot1.png")
  with(data, hist(Global_active_power, col="red", main="Global Active Power", 
                  xlab="Global Active Power (kilowatts)"))
  dev.off() 
}
  
filename <- "../data/household_power_consumption.txt"
plot1(filename)
