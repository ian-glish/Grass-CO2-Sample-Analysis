# Grass-CO2-Sample-Analysis

This project investigates the carbon dioxide (CO2) uptake of grass species under different environmental treatments using R. The analysis leverages the built-in `CO2` dataset in R to explore statistical relationships, perform hypothesis testing, and visualize patterns in plant physiology across treatment groups.

 **[Watch the Presentation on YouTube](https://studio.youtube.com/watch?v=tCIgaYRln_M)** 

---

## 🎯 Objective

To apply statistical analysis techniques in R—including hypothesis testing, exploratory data analysis (EDA), and correlation analysis—to examine how treatment conditions influence CO2 uptake in grass species.

---

## 📄 Dataset Overview

The dataset used is R's built-in `CO2` dataset, which contains 84 observations from an experiment on cold tolerance in the grass species *Echinochloa crus-galli*. It includes variables such as:

- `Plant` – Individual plant identifier
- `Type` – Origin of the grass sample (Quebec or Mississippi)
- `Treatment` – Condition applied (chilled or nonchilled)
- `conc` – Ambient CO2 concentration
- `uptake` – Rate of CO2 uptake (response variable)

> ⚠️ Note: This project uses the **`CO2`** dataset (uppercase) from base R, not the Mauna Loa atmospheric CO2 dataset (`co2` lowercase).

---

## 🧪 Key Analyses

### 1. Data Exploration
- Used `head()` and `summary()` to examine the structure and statistical properties of the dataset.
- Calculated descriptive statistics (mean, mode, variance, standard deviation, range) for `conc` and `uptake`.
- Filtered and summarized data for treatment-specific insights.

**Example results:**
- Mean CO2 uptake (chilled): **23.78**
- Mean CO2 uptake (nonchilled): **30.64**
- Most frequent CO2 concentration: **95**
- Range of CO2 uptake: **37.8**

---

### 2. Data Visualization (EDA & Correlation)

Used `ggplot2` to visualize patterns in the data:

- **Boxplots**: CO2 uptake by grass type and treatment condition
- **Scatterplots**: Relationship between CO2 concentration (`conc`) and uptake
- **Grouped Visuals**: Visualizing individual plant performance by treatment

**Example chart titles:**
- *CO2 Uptake Rate Based on the Type of Grass Sample*
- *Relationship Between CO2 Concentration and Uptake (by Treatment)*

---

### 3. Hypothesis Testing – t-Test

Performed an independent two-sample t-test comparing `uptake` between chilled and nonchilled treatments.

**Result:**
- **p-value < 0.01**, indicating a statistically significant difference in mean CO2 uptake between the two treatment groups.

---

### 4. Correlation Analysis

Computed the correlation between CO2 concentration and uptake rate:

- **Pearson correlation coefficient:** **0.49**
  - Suggests a moderate positive relationship between CO2 concentration and uptake.
