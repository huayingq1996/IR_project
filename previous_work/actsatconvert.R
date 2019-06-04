df<-read.csv("~/actconvert.csv")
df<-data.frame(df) #getting the dataset with unitid (for merging), sat and act
conversion <- read.table(text = "ACT SAT
36 1590
35 1540
34 1500
33 1460
32 1430
31 1400
30 1370
29 1340
28 1310
27 1280
26 1240
25 1210
24 1180
23 1140
22 1110
21 1080
20 1040
19 1010
18 970
17 930
16 890
15 850
14 800
13 760
12 710
11 670
10 630
9  590", header = TRUE) #this is the concordance table

df$act2017<-round(as.numeric(df$act2017)) #rounding the averages
df<-transform(df, newgrade2017 = (FALSE | act2017) * 
                (conversion$SAT[match(df$act2017, conversion$ACT)] ^
                   as.logical(act2017))) #newSAT
df$act2016<-round(as.numeric(df$act2016)) #rounding the averages
df<-transform(df, newgrade2016 = (FALSE | act2016) * 
                (conversion$SAT[match(df$act2016, conversion$ACT)] ^
                   as.logical(act2016))) #newSAT
df$act2015<-round(as.numeric(df$act2015)) #rounding the averages
df<-transform(df, newgrade2015 = (FALSE | act2015) * 
                (conversion$SAT[match(df$act2015, conversion$ACT)] ^
                   as.logical(act2015))) #newSAT
df$act2011<-round(as.numeric(df$act2011)) #rounding the averages
df<-transform(df, newgrade2011 = (FALSE | act2011) * 
                (conversion$SAT[match(df$act2011, conversion$ACT)] ^
                   as.logical(act2011))) #newSAT
df$act2010<-round(as.numeric(df$act2010)) #rounding the averages
df<-transform(df, newgrade2010 = (FALSE | act2010) * 
                (conversion$SAT[match(df$act2010, conversion$ACT)] ^
                   as.logical(act2010))) #newSAT
df$act2009<-round(as.numeric(df$act2009)) #rounding the averages
df<-transform(df, newgrade2009 = (FALSE | act2009) * 
                (conversion$SAT[match(df$act2009, conversion$ACT)] ^
                   as.logical(act2009))) #newSAT
write.csv(df, "~/convertedscore.csv")
