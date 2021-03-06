source("code/global/load_packages.R", local = TRUE)
source("config/paths.R", local = TRUE)

source("code/functions/date_func.R", local = TRUE)
#data_percent <- 0
#precip_value <-"background-color:green"
#potato <- "background-color:navy"
#data_index = 1
green <- "background-color:#5CC33D"
yellow <- "background-color:yellow"
orange <- "background-color:orange"
red <- "background-color:red"
navy <- "background-color:navy"
black <- "background-color: black"

map_green <- "#5CC33D"
map_yellow <- "yellow"
map_orange <- "orange"
map_red <- "red"

#western_central = readOGR(dsn=map_path, layer = "western_central")

clipcentral = readOGR(dsn=map_path, layer = "clipcentral")

western_dslv = readOGR(dsn=map_path, layer = "western_dslv")

clipcentral_t <- spTransform(clipcentral, CRS("+init=epsg:4326"))

western_region_t <- spTransform(western_dslv, CRS("+init=epsg:4326"))

#DROUGHT REGIONS
# eastern_region = readOGR(dsn=map_path, layer = "eastern-region")
# 
# eastern_region_border = readOGR(dsn=map_path, layer = "eastern-region-border")
# 
# clipsouthern3 = readOGR(dsn=map_path, layer = "clipsouthern3")
# 
# wssc_service = readOGR(dsn=map_path, layer = "wssc service")
# 
# clipcentral = readOGR(dsn=map_path, layer = "clipcentral")
# 
# baltimore_service = readOGR(dsn=map_path, layer = "baltimore service")
# 
# clipcentral_border = readOGR(dsn=map_path, layer = "clipcentral-border")
# 
# clipsouthern_border = readOGR(dsn=map_path, layer = "clipsouthern-border")



# path_p <- "C:\\Users\\icprbadmin\\Documents\\R\\2018drex\\input\\ts\\state\\i_a1b\\va_shenandoah_p.csv"
# path_q <- "C:\\Users\\icprbadmin\\Documents\\R\\2018drex\\input\\ts\\state\\i_a1b\\va_shenandoah_q.csv"
# path_s <- "C:\\Users\\icprbadmin\\Documents\\R\\2018drex\\input\\ts\\state\\i_a1b\\va_shenandoah_stor.csv"
# path_g <- "C:\\Users\\icprbadmin\\Documents\\R\\2018drex\\input\\ts\\state\\i_a1b\\va_shenandoah_gw.csv"
# 
# #for mac use
# if( .Platform$OS.type == "unix" ) {
#   path_p <- "/Users/lukevawter/Desktop/R/2018drex/input/ts/state/i_a1b/va_shenandoah_p.csv"
#   path_q <- "/Users/lukevawter/Desktop/R/2018drex/input/ts/state/i_a1b/va_shenandoah_q.csv"
#   path_s <- "/Users/lukevawter/Desktop/R/2018drex/input/ts/state/i_a1b/va_shenandoah_stor.csv"
#   path_g <- "/Users/lukevawter/Desktop/R/2018drex/input/ts/state/i_a1b/va_shenandoah_gw.csv"
# }

# path_p <- paste0(ts_path,"va_shenandoah_p.csv")
# path_q <- paste0(ts_path,"va_shenandoah_q.csv")
# path_s <- paste0(ts_path,"va_shenandoah_stor.csv")
# path_g <- paste0(ts_path,"va_shenandoah_gw.csv")
# # 
# my_data_p = fread(path_p)
# my_data_q = fread(path_q)
# my_data_s = fread(path_s)
# my_data_g = fread(path_g)

my_data_p <-fread(paste(ts_path, "va_shenandoah_p.csv", sep = ""))
my_data_q = fread(paste(ts_path,"va_shenandoah_q.csv", sep = ""))
my_data_s = fread(paste(ts_path,"va_shenandoah_stor.csv", sep = ""))
my_data_g = fread(paste(ts_path,"va_shenandoah_gw.csv", sep = ""))
