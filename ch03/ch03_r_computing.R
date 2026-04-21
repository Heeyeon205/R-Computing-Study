# 1. (12,4,8,19,6,11,22)를 원소로 갖는 data_vec이라는 이름의 벡터를 생성하고,
# 이 백터를 기반으로 다음 작업을 수행하시오

# 1) data_vec의 1,4,6번째 자료를 출력하시오.
data_vec <- c(12,4,8,19,6,11,22)
data_vec
data_vec[c(1,4,6)]

# 2) data_vec에서 4,5,번째 자료를 제거한 백터를 생성하여 
# data_vec2라는 이름으로 저장하시오.
data_vec2 <- data_vec[-c(4,5)]
data_vec
data_vec2

# 3) data_vec의 2번째 자료값을 10으로 수정하고, data_vec에 다시 저장하시오.
data_vec
data_vec <- replace(data_vec, 2, 10)
data_vec

# 4) data_vec2의 3번째 자료 뒤에 99를 삽입하여 data_vec2라는 이름으로 다시 저장하시오.
data_vec2
data_vec2 <- append(data_vec2, 99, after = 3)
data_vec2

# 2. R에 저장되어 있는 state.x77의 데이터를 이용하여 다음 물음에 답하시오.

# 1) 4번째 행과 7번째 열이 교차하는 원소를 추출하시오
state.x77
state.x77[4, 7]

# 2) 7,17,28행의 2,5,7열에 해당하는 값을 추출하시오
state.x77[c(7,17,28), c(2,5,7)]

# 3) 5행부터 50행까지를 제외한 나머지 행의 3열부터 5열까지의 원소를 추출하시오.
state.x77[-c(5:50), c(3:5)]

# 4) state.x77에서 Population이 4,000보다 큰 주들의 Income을 추출하시오
state.x77[state.x77[, "Population"] > 4000, "Income"]

# 3 R에서 array() 함수와 dim() 함수를 사용하여 배열을 생성하고,
# 배열의 원소를 추출하거나 배열 간의 연산을 수행해 보시오.

# 1) array() 함수를 사용하여 1부터 12까지의 정수로 구성된 3행 2열의 행렬
# 2개로 이루어진 배열을 생성하고, 이를 arr1 이라는 이름으로 저장하시오.
arr1 <- array(1:12, c(3, 2, 2))
arr1

# 2) 배열 arr1의 두 번째 행렬에서 3행 1열의 값을 출력하시오.
arr1
arr1[3, 1, 2]

# 3) 1부터 12까지의 값을 갖는 벡터에 dim()함수를 사용하여 2행 2열의 행렬 3개로
# 구성된 배열을 만들고, 이를 arr2 라는 이름으로 저장하시오.
x <- c(1:12)
x
dim(x) <- c(2,2,3)
x
arr2 <- x
arr2

# 4) 배열 arr2의 첫 번째 행렬에서 2행 2열의 값을 출력하시오.
arr2[2,2,1]

# 5) 배열 arr1과 arr2에 대해 원소별 곱셈 연산을 수행하고, 그 결과를 설명하시오
arr1 * arr2 # 차원이 달라 연산 불가

# 6) 배열 간의 %*% 곱셈은 어떻게 산출되는지 설명하시오
arr1 %*% arr2 # 두 배열 원소들의 곱의 합

# 4. R의 내장 데이터는 iris를 이용하여 당므 조건을 만족하는 리스트를 생성하시오.

# 1) iris 데이터에서 종(species)의 이름만 추출하여 첫 번째 성분으로 한다.
iris
newlist <- list(iris$Species)
newlist[[1]]

# 2) 종별 개수를 구하여 두 번째 성분으로 한다.
newlist[[2]] <- table(iris$Species)
newlist[[2]]

# 3) Sepal.Length와 Sepal.Width의 평균값을 계산하여 세 번째 성분으로 한다.
newlist[[3]] <- c(avg_length = mean(iris$Sepal.Length),
                         avg_width = mean(iris$Sepal.Width))
newlist[[3]]

# 4) Petal.Length와 Petal.Width의 평균값을 계산하여 네 번째 성분으로 한다.
newlist[[4]] <- colMeans(iris[, c("Petal.Length", "Petal.Width")])
newlist[[4]]

# 5) 임의의 문자 벡터를 생성하여 다섯 번째 성분으로 한다.
newlist[[5]] <- c("AA","BB","CC","DD","EE")
newlist[[5]]

# 6) iris 데이터 전체를 여섯번째 성분으로 추가한다.
newlist[[6]] <- iris
newlist[[6]]

# 7) 이와 같이 구성된 리스트에서 여섯 번째 성분의 1행부터 4행까지
# 그리고 3열부터 5열까지의 원소만 추출하시오
newlist[[6]][1:4, 3:5]

# 5. UCL 데이터공유사이트에는 와인의 화학성분을 조사한 wine 데이터가 
# https://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data 
# 와 같이 저장되어 있다.

# 1) 위 웹사이트에 접속하여 데이터의 형태를 살펴보시오(변수형 유무, 구분자 형태 등)

# 2) 적절한 함수를 이용하여 웹사이트의 데이터를 직접 읽어 들이시오.
# 읽어 온 데이터는 winedat 이라는 이름으로 저장하시오.
wineurl <- "https://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data"
winedat <- read.table(wineurl, sep = ",")
winedat

# 3) winedat 데이터 변수 개수와 관측값의 개수를 구하시오.
dim(winedat)

# 4) write.table() 함수를 이용하여 winedat 데이터를 공백(탭)이 구분기호로
# 사용된 wine.txt 라는 이름의 파일로 외부에 저장하시오
getwd()
write.table(winedat, file = "wine.txt",sep = " ")

# 5) read.table() 함수를 이용하여 wine.txt 파일을 R로 읽어 들이고,
# wine_tab 데이터 프레임을 생성하시오
wine_tab <- read.table(file = "ch03/wine.txt", sep = " ")
wine_tab