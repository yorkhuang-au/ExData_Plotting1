###
### Function to plot plot3
###

plot3 <- function(filename) {
  
  lines <- readLines(filename)
  want <- grepl("^[12]/2/2007.*", lines)
  want[1] <- TRUE
  
  data <- read.table(textConnection(lines[want]), sep=";", header=TRUE, 
                     na.strings="?")
  png("plot3.png")
  data$Datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
  
  with(data, plot(x=Datetime, y=Sub_metering_1, type="l",
                  ylab="Energy sub metering",
                  xlab=NA, col="black"))
  
  with(data, lines(x=Datetime, y=Sub_metering_2, col="red"))
  
  with(data, lines(x=Datetime, y=Sub_metering_3, col="blue"))
  
  legend("topright", lty=c(1,1,1), 
         legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
         col=c("black","red","blue"))
  
  dev.off()
}

filename <- "../data/household_power_consumption.txt"
plot3(filename)
