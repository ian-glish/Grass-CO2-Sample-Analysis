library(tidyverse)
?CO2
View(CO2)

#1. Data Exploration
#head() and summary() for total CO2 dataset
head(CO2)
summary(CO2)

head(CO2,7)
summary(CO2)

# chilled filtered column dataset
filteredCO2_Treatment_chilled <- CO2 %>%
  filter(Treatment == "chilled") 

# finding chilled treatment filtered column mean
filteredCO2Treatment_chilleduptake_mean <- mean(filteredCO2_Treatment_chilled$uptake)
print(filteredCO2Treatment_chilleduptake_mean)
# chilled_uptake_mean = 23.78333

# getting the summary with the treatment column filtered for chilled
summary(filteredCO2_Treatment_chilled)

# nonchilled filtered column dataset
filteredCO2_Treatment_nonchilled <- CO2 %>%
  filter(Treatment == "nonchilled") 

# finding nonchilled treatment filtered column mean
filteredCO2Treatment_nonchilleduptake_mean <- mean(filteredCO2_Treatment_nonchilled$uptake)
print(filteredCO2Treatment_nonchilleduptake_mean)
# nonchilled_uptake_mean = 30.64286

# getting the summary with the treatment column filtered for nonchilled
summary(filteredCO2_Treatment_nonchilled)

# Mode calculations for conc and uptake columns
# Mode calculation for conc column 
getmode <-function(x) {
  uniqx <- unique(x)
  uniqx[which.max(tabulate(match(x,uniqx)))]
}
getmode(CO2$conc)
# Mode for conc column is 95

# Mode calculation for uptake column 
getmode <-function(x) {
  uniqx <- unique(x)
  uniqx[which.max(tabulate(match(x,uniqx)))]
}
getmode(CO2$uptake)
# Mode for uptake column is 32.4

# conc column variability stats
# Range for conc column
range_conc <- max(CO2$conc) - min(CO2$conc)
print(range_conc)
# Range for conc is 905

# Variance for conc column
variance_conc <- var(CO2$conc)
print(variance_conc)
# Variance for conc is 87571.08

# Standard deviation for conc column
sd_conc <- sd(CO2$conc)
print(sd_conc)
# Standard deviation for conc is 295.9241

# uptake column variability stats
# Range for uptake column
range_uptake <- max(CO2$uptake) - min(CO2$uptake)
print(range_uptake)
# Range for uptake is 37.8

# Variance for uptake column
variance_uptake <- var(CO2$uptake)
print(variance_uptake)
# Variance for uptake is 116.9515

# Standard deviation for uptake column
sd_uptake <- sd(CO2$uptake)
print(sd_uptake)
# Standard deviation for uptake is 10.81441

#2. Visulizations for all of the presentation (EDA and correlation)
#viz 1 - showing the uptake of co2 based on the type(origin) of grass via a boxplot
ggplot(CO2, aes(x = Type, y = uptake, fill = Type)) +
  geom_boxplot() +
  labs(title = "CO2 Uptake Rate Based on the Type of Grass Sample",
       x = "Type of Grass Sample",
       y = "CO2 Uptake Rate (μmol/m^2/sec)")

#viz 2 # combined boxplot, building on #1, showing details on type
ggplot(CO2, aes(x = Type, y = uptake, fill = Treatment)) +
  geom_boxplot() +
  labs(title = "CO2 Uptake Rate Based On the Type of Grass Sample per Treatment",
       x = "Type of Grass Sample",
       y = "CO2 Uptake Rate (μmol/m^2/sec)")

#viz 3 - a detailed and different view of #2, showing the specific grass sample tester's data
ggplot(CO2, aes(x = Plant, y = uptake, fill = Treatment)) +
  geom_boxplot() +
  labs(title = "CO2 Uptake Rate Based on the Grass Sample Unique Identifier per Treatment",
       x = "Grass Sample Unique Identifier",
       y = "CO2 Uptake Rate (μmol/m^2/sec)")


#viz 4 - T-test scatterplot with line of best fit
ggplot(CO2, aes(x = conc, y = uptake)) +
  geom_point() +
  geom_smooth() +
  labs(title = "Relationship Between CO2 concentration and CO2 Uptake",
       x = "Ambient CO2 Concentration (mL/L)",
       y = "CO2 Uptake Rate (μmol/m^2/sec)") 


#viz 5 - T-test scatterplot with line of best fit and colors based on treatment
ggplot(CO2, aes(x = conc, y = uptake, fill = Treatment)) +
  geom_point() +
  geom_smooth() +
  labs(title = "Relationship Between CO2 concentration and CO2 Uptake",
       x = "Ambient CO2 Concentration (mL/L)",
       y = "CO2 Uptake Rate (μmol/m^2/sec)",
       color = "Treatment") 

#3. performing 2 variable t-test
t_test_results <- t.test(uptake ~ Treatment, data = CO2, var.equal = FALSE)
print(t_test_results)

#4. using correlation function
correlation_result <- cor(CO2$uptake, CO2$conc)
print(correlation_result)
# correlation coeficient is 0.4851774


