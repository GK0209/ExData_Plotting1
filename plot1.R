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

#Create the plot1.png file and plot the graph
png('plot1.png',width=480,height=480)
hist(data[,3],col='red',xlab='Global Active Power (kilowatts)', ylab='Frequency',main='Global Active Power')
dev.off()
