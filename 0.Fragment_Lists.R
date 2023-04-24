#
CurrentFragments<-read.csv("Metadata/Fragment_Replicate.csv")
IPAM_Pilot<-read.csv("Tanks.csv")

All<-dplyr::full_join(CurrentFragments, IPAM_Pilot, by ="Fragment")
Typos<-dplyr::anti_join(IPAM_Pilot, CurrentFragments, by ="Fragment")
Duplicates <- All$Fragment[duplicated(All$Fragment)]
Pilot_genotypes<-dplyr::left_join(IPAM_Pilot, CurrentFragments, by ="Fragment")

write.csv(Pilot_genotypes, "Tanks_genotypes.csv", row.names = F)# Add date to keep versions

# Clean working space
rm(list = ls())

