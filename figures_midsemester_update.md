## Figures!

Making figures for the midsemester update presentation.

```
library(ggplot2)

#fresh vs frozen TbCl assay
fresh_frozen_TbCl <- read.delim("~/GitHub/fresh_frozen_TbCl.txt")
ggplot(fresh_frozen_TbCl, aes(Fresh_fluor, Froz_fluor, color=Type1))+
  geom_point()+
  ylab("TbCl fluorescence- Frozen Samples")+
  xlab("TbCl fluorescence- Fresh Samples")+
  theme_bw()+
  facet_wrap(~Common_name, scales='free')+
  geom_smooth(method='lm')

#spearman rho > 0.95, P< 0.001

#percent spores CFU
spores<-read.delim("/Users/patty/OneDrive/Documents/GitHub/spore_cfu.txt", header=T)
ggplot(spores, aes(Method, Per_spore))+
  geom_boxplot()+
  theme_bw()+
  facet_wrap(~Common_name)+
  coord_flip()+
  ylab("Percent spore-forming bacteria")+
  xlab("")

#fluor over time
fluor_time<-read.delim("/Users/patty/OneDrive/Documents/GitHub/fluor_over_time.txt", header=T)
ggplot(fluor_time, aes(Time, Fluor, color=Sample_type))+
  geom_point()+
  facet_wrap(~Common_name)+
  ylab("TbCl fluorescence")+
  xlab("Time (hrs)")+
  geom_smooth()

#percent viable spores
per_viable_spores <- read.delim("~/GitHub/per_viable_spores.txt")
ggplot(per_viable_spores, aes(Type1, Per_viable))+
  geom_boxplot()+
  theme_bw()+
  ylab("Percent viable spores (TbCl assay)")+
  xlab("Method")+
  facet_wrap(~Common_name)

#CFUs
cfu <- read.delim("~/GitHub/cfu.txt")
ggplot(cfu, aes(Method, cfu$CFU.ml))+
  facet_wrap(~Species)+
  geom_boxplot()+
  theme_bw()+
  scale_y_log10()+
xlab("")+
  ylab("CFU/mL")

#RIBBiTR data
ribspore <- read.delim("~/GitHub/ribspore.txt")
ggplot(ribspore, aes(Month_sampled, Raw.Data..290.485., fill=Location))+
  geom_boxplot()+
  facet_wrap(~Species)+
  theme_bw()+
  ylab("TbCl fluorescence")+
  xlab("Month Sampled")
```
