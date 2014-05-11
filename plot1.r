plot1 <- function(){
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
    
    # Plot histogram of global active power
    hist(data$Global_active_power,col = "red",xlab = "Global Active Power (kw)",main = "Global Active Power")
    
    # Save histogram as a .png bitmap
    dev.copy(png, file = "plot1.png")
    dev.off()
}