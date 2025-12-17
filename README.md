# Personal Sleep Analysis Portfolio 🌙

## 📌 Project Overview
This project analyzes personal sleep data tracked over approximately 70 nights using the **Sleep Cycle** iPhone app. The primary goals of this analysis were to:
1.  **Identify patterns:** Determine which behaviors (like bedtimes or step count) correlate with deeper, higher-quality rest.
2.  **Reverse Engineer the Algorithm:** Use statistical modeling to uncover the specific formula the app uses to calculate its proprietary "Sleep Quality Score".

## 📂 Repository Structure
Here is how the files are organized in this repository:

* **`data/`**
    * `sleep_clean2.csv`: The processed dataset used for analysis, containing variables like `sleep_quality`, `regularity`, `deep_sleep_hours`, and `movements_per_hour`.
* **`scripts/`**
    * `01_data_cleaning.R`: An R script that takes the raw export, cleans column names, fixes date formatting using `lubridate`, and calculates duration metrics .
    * `personal_sleep_analysis.Rmd`: The main R Markdown file containing the exploratory data analysis (EDA), visualizations, and linear regression modeling .
* **`Personal Sleep Analysis.pdf`**: The final knitted report containing all charts, code, and the conclusion .

## 🛠 Tools & Libraries Used
This project was built entirely in **R** using **RStudio**.
* **Data Manipulation:** `tidyverse` (dplyr, readr), `janitor`, `lubridate`.
* **Visualization:** `ggplot2`, `corrplot`.
* **Statistical Modeling:** `car` (for checking Multicollinearity/VIF), `stats` (Linear Regression).

## 📊 Key Findings
Through linear regression analysis ($R^2 = 0.92$), I successfully reverse-engineered the app's scoring formula. The model suggests the "Sleep Quality" score is calculated as follows:

$$Quality = 19 + 8(TotalHours) + 8.3(DeepHours) - 0.65(Movements) + 5.4(DreamHours)$$

**Insights:**
* **Baseline:** You start with ~19 points just for falling asleep.
* **Deep Sleep Value:** Deep sleep is "weighted" roughly double compared to light sleep (Base 8 + Bonus 8.3 points).
* **Restlessness:** Each movement per hour reduces the score by approximately 0.65 points.

## 🚀 How to View
You can read the full analysis including all charts and code explanations in the **[Personal Sleep Analysis.pdf](Personal%20Sleep%20Analysis.pdf)** file.
