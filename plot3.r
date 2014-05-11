plot3 <- function(){
    # My computer is slow, so I ony get the needed lines. 
    # Method from Markus Spath
    data <- read.table("household_power_consumption.txt",
                       skip = 66637, nrow = 2880, sep = ";",na.strings="?", 
                       col.names = colnames(read.table(
                           "household_power_consumption.txt",
                           nrow = 1, header = TRUE, sep=";")))
    # Convert date to date class 
    date_time <- paste(data$Date,data$Time, sep = " ")
    date_time <- strptime(date_time,format = "%d/%m/%Y %H:%M:%S")
    data[,1]<-as.Date(date_time)
    
    # Create plots and add legend
    with(data, plot(Date,Sub_metering_1,ylab = "Energy sub metering",xlab = "",type = "l"))
    with(data, points(Date,Sub_metering_2, col = "red",type = "l"))
    with(data, points(Date,Sub_metering_3, col = "blue",type = "l"))
    legend("topright", pch = 1, col = c("black","blue", "red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    
    
    # Save plot as a .png bitmap
    dev.copy(png, file = "plot3.png")
    dev.off()
}