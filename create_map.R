# Kort i R, 2025-04-14 by hhs

# Load libraries
library(tidyverse)
library(sf)

# Load some data with municipality data
df<-read.csv("unedata.csv",sep=";")

# Load shapefile
dk_kom<-read_sf("KOMMUNE.shp")%>%
  mutate(komcode=as.numeric(substr(KOMKODE,2,4)))


# Merge
df<-merge(df,dk_kom,by="komcode")



# Static map
ggplot(df, aes(geometry=geometry,fill=unemployment))+
  geom_sf()+
  theme_void()