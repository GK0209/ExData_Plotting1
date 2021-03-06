#Set the location of working direct to dataset location
setwd("~/Coursera")
df <- "household_power_consumption.txt"

# read the textfile
data <- read.table(df, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# merge date and time into a single column (all string variables)
data$Datetime <- paste(as.character(data[,1]) , data[,2])

# convert the Date column's datatype from string to date
data[,1] <- as.Date(data$Date,'%d/%m/%Y')

#select only the two required days
data <- subset(data, Date == '2007-02-01' | Date == '2007-02-02')

# convert the Global Active Power's datatype from text to numbers
data[,3] <- as.numeric(as.character(data[,3]))

# Convert all Sub_metering to numbers
data$Sub_metering_1 <- (as.numeric(as.character(data$Sub_metering_1)))
data$Sub_metering_2 <- (as.numeric(as.character(data$Sub_metering_2)))
data$Sub_metering_3 <- (as.numeric(as.character(data$Sub_metering_3)))

# create a datetime object
data.new <- strptime(data$Datetime, '%d/%m/%Y %H:%M')

#Create the plot3.png file and plot the graph
png('plot3.png',width=480,height=480)
plot(data.new,data$Sub_metering_1,ylab='Energy sub metering',xlab='',type='line')
lines(data.new,data$Sub_metering_2,col='red')
lines(data.new,data$Sub_metering_3,col='blue')
legend("topright",legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col=c('black','red','blue'), lty=1,lwd=1.5)
dev.off()
