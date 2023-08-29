# ctchosney.github.io

# Education

```{r}
library(tibble)
tribble(
  ~ Degree, ~ Year, ~ Institution, ~ Where,
  "Informal studies", "1889-91", "Flying University", "Warsaw, Poland",
  "Master of Physics", "1893", "Sorbonne Université", "Paris, France",
  "Master of Mathematics", "1894", "Sorbonne Université", "Paris, France"
) %>% 
  detailed_entries(Degree, Year, Institution, Where)
```
