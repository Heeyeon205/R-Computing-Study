# 데이터과학을 위해 자주 쓰이는 여러 패키지를 묶어 제공하는 통합 생태계
install.packages("tidyverse")
library(tidyverse)

# dplyr : 데이터 가공 담당
# ggplot2 : 데이터 시각화 패키지
# tidyr : 데이터 정돈
# readr : 외부 데이터 불러오기
# tibble : 데이터를 저장하는 기본 구조 개선
# stringr : 텍스트 데이터 핸들링
# forcats : 범주형 자료 핸들링
# purrr : 반복 연산 단순화
# lubridate : 날짜와 시간 핸들링

# 예제 4-1 데이터프레임과 tibble의 비교
tb1 <- tibble(학번 = 101:103, 
              국어 = c(85,90,78),
              수학 = c(92,88,81))
tb1
tb1 + 5

# 예제 4-2 tribble() 함수의 기능능
tb2 <- tribble(
  ~학번, ~이름, ~합격여부,
  201, "Alice", T,
  202, "Bob", F,
  203, "Clare", T
)
tb2

diamonds
print(diamonds, n = 10, width = Inf)

# 예제 4-3 R 내장데이터인 iris를 tibbe로 바꾸어 보자.
iris1 <- as.tibble(iris)
iris1

# 예제 4-4 4-1의 tibble 데이터 프레임을 전통적인 데이터프레임으로 변환
df1 <- as.data.frame(tb1)
df1
str(df1)

# 예제 4-5 R내장 데이터인 mtcars 데이터에서 행 이름을 변수로 바꾸어 tibble로 변환해보자.
mtcars1 <- as.tibble(rownames_to_column(mtcars))
mtcars1

# 4.3.1 read_csv() : 콤마로 구분된 csv 파일 읽기
# 예제 4-6 read_csv() 함수
library(readr)

getwd()
write.csv(tb2, "ch04/students.csv", row.names = F)

students <- read_csv("ch04/students.csv")
students

# 예제 4-7 read_tsv() : 탭을 ㅗ구분되어 있는 데이터 불러오기
df3 <- data.frame(
  id = c(101:103),
  name = c("Alice", "Bob", "Clare"),
  score = c(85,90,88)
)
write.table(df3, file = "ch04/students2.tsv", sep = "\t", row.names = F, quote = F)

students2 <- read_tsv("ch04/students2.tsv")
students2

# 예제 4-8 구분자 세미콜론 불러오기
write.table(df3, file = "ch04/students3.txt", sep = ";", row.names = F, quote = F)
students3 <- read_delim("ch04/students3.txt", delim = ";")
students3

# 예제 4-9 공백 구분자 불러오기
write.table(df3, file = "ch04/students4.txt", sep = " ", row.names = F, quote = F)
students4 <- read_table("ch04/students4.txt")
students4

# 예제 4-11 dplyr 내장 패키지 tibble 데이터프레임 storms에서 풍속이 100이상이면서
# 기압이 950 이하인 강력한 태풍의 기록 추출
library(dplyr)
storms_data <- filter(storms, wind >= 100, pressure <= 950)
storms_data

# 예제 4-12 특정 조건을 만족하는 열 추출 select()
# storms 데이터에서 name, year, lat, long, wind, pressure 변수만 추출
select(storms, name, year, lat, long, wind, pressure)

# 예제 4-13 새로운 변수 생성 및 추가 mutate()
# 풍속에서 중심기압의 1/10 값을 뺀 값을 새로운 변수 storm_index로 정의
storms_data2 <- mutate(storms, storm_index = wind - pressure / 10)
select(storms_data2, name, year, pressure, storm_index)

# 예제 4-14 데이터의 정렬 arrange()
# wind 풍속 기준으로 데이터 정렬
arrange(storms, wind)
arrange(storms, desc(wind))

# 예제 4-15 파이프연산자
storms$wind %>% mean
mean(storms$wind)

storms$wind %>% sample(5)
sample(storms$wind, 5)

# 예제 4-16 주요 통계량의 산출 : summarize()
# summary() 함수와 summarize() 함수 차이
summary(storms)
storms %>% summarize(
  평균풍속 = mean(wind),
  최댓값풍속 = max(wind),
  평균기압 = mean(pressure),
  최솟값기압 = min(pressure),
  관측치수 = n()
  )

# 예제 4-17 그룹별 연산 : group_by()
# 연도별 풍속을 구해보자
storms %>%
  group_by(year) %>%
  summarize(mean_wind = mean(wind))