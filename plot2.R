###
### Function to plot plot2
###
plot2 <- function(filename) {
  lines <- readLines(filename)
  want <- grepl("^[12]/2/2007.*", lines)
  want[1] <- TRUE
  
  data <- read.table(textConnection(lines[want]), sep=";", header=TRUE,
                     na.strings="?")
  png("plot2.png")
  data$Datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
  
  with(data, plot(x=Datetime, y=Global_active_power, type="l",
                  ylab="Global Active Power (kilowatts)",
                  xlab=NA))
  
  dev.off()
}

filename <- "../data/household_power_consumption.txt"
plot2(filename)
