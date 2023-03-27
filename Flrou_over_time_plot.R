##'--------------------------------
##' Lab Data Analysis
##' Fluorescense Over Time
##' 2023-03-27
##'
##'---------------------------------

fluor_over_time <- read.table("data/fluor_over_time.txt", sep = '\t', header = T)
fluor_over_time

ggplot(fluor_over_time, aes(x = as.factor(Time), y =Fluor, fill = Sample_type)) +
  geom_boxplot() +
  geom_jitter() +
  xlab("Time") +
  ylab("Fluorescense") +
  facet_wrap(facet = vars(Common_name)) +
  theme_minimal() +
  ggtitle("Fluoresecense Readings Over Time") +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(text = element_text(family = 'serif', face = 'bold', size = 12)) +
  labs(fill = "Sample Type")
