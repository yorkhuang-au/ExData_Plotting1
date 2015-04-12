###
### Function to plot plot4
###
plot4 <- function(filename) {
  lines <- readLines(filename)
  want <- grepl("^[12]/2/2007.*", lines)
  want[1] <- TRUE
  
  data <- read.table(textConnection(lines[want]), sep=";", header=TRUE, 
                     na.strings="?")
  png("plot4.png")
  data$Datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
  
  par(mfrow=c(2,2))
  with(data, plot(x=Datetime, y=Global_active_power, type="l",
                  ylab="Global Active Power (kilowatts)",
                  xlab=NA))
  
  with(data, plot(x=Datetime, y=Voltage, type="l",
                  xlab="datetime"))
  
  with(data, plot(x=Datetime, y=Sub_metering_1, type="l",
                  ylab="Energy sub metering",
                  xlab=NA, col="black"))
  
  with(data, lines(x=Datetime, y=Sub_metering_2, col="red"))
  
  with(data, lines(x=Datetime, y=Sub_metering_3, col="blue"))
  
  legend("topright", lty=c(1,1,1), 
         legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
         col=c("black","red","blue"), 
         bty="n")
  
  with(data, plot(x=Datetime, y=Global_reactive_power, type="l",
                  xlab="datetime"))
  
  dev.off()
}


filename <- "../data/household_power_consumption.txt"
plot4(filename)

