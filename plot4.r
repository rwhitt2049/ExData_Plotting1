plot4 <- function(){
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
    
    # Create new parameter for a 2x2 plot
    old.par <- par(mfrow=c(2, 2))
        # Plot 1
        plot(date_time,Global_active_power, type = "l",xlab ="",ylab = "Global Active Power (kw)")
        
        # Plot 2
        plot(date_time,Voltage, type = "l",xlab ="datetime",ylab = "Voltage")
        
        # Plot 3
        plot(date_time,Sub_metering_1,ylab = "Energy sub metering",xlab = "",type = "l")
        points(date_time,Sub_metering_2, col = "red",type = "l")
        points(date_time,Sub_metering_3, col = "blue",type = "l")
        legend("topright", pch = "-", col = c("black","blue", "red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex = 0.5)
        
        # Plot 4
        plot(date_time,Global_reactive_power, type = "l",xlab ="datetime")
        
    # Close the new parameter
    par(old.par)
    
    # Save histogram as a .png bitmap
    dev.copy(png, file = "plot4.png")
    dev.off()
}
