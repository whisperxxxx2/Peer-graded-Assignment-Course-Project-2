
if (!file.exists("NEI_data.zip")) {
  download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip",destfile="NEI_data.zip")
}
if(!(file.exists("summarySCC_PM25.rds"))) { 
  unzip("NEI_data.zip") 
}
