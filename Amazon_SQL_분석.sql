#1. 리뷰 기반 인기 상품 추천 시스템
#사용자 리뷰 데이터를 활용하여 리뷰 수가 많은 상품을 인기 상품으로 판단하고 추천하는 방식.
SELECT
  product_id,
  COUNT(*) AS review_count
FROM `project-c2dbf631-206a-40e8-a71.Day3.amazon`
GROUP BY product_id
ORDER BY review_count DESC
LIMIT 10;
#이 결과를 통하여 사용자에게 인기있는 상품을 추천할 수 있으며, 초기 추천 시스템으로 활용할 수 있음.

#2. 평점 기반 추천 시즈템
#상품에 대한 사용자 평점을 기반으로 평균 평점이 높은 상품을 추천하는 방식.
SELECT
  product_id,
  AVG(SAFE_CAST(rating AS FLOAT64)) AS avg_rating
FROM `project-c2dbf631-206a-40e8-a71.Day3.amazon`
GROUP BY product_id
ORDER BY avg_rating DESC
LIMIT 10;
#평균 평점이 높은 상위 10개 상품을 추천 리스트로 제공할 수 있음.

#3.리뷰 수 + 평점 결합 추천 시스템
#리뷰 수와 평균 점평을 동시에 사용하여 신뢰도가 높은 상품을 추천하는 방식.
SELECT product_id,
COUNT(*) AS review_count,
AVG(SAFE_CAST(rating AS FLOAT64)) AS avg_rating
FROM `project-c2dbf631-206a-40e8-a71.Day3.amazon`
GROUP BY product_id
ORDER BY avg_rating DESC, review_count DESC
LIMIT 10;
#평점이 높고 리뷰수가 많은 상품들을 동시에 고려하여 추천 정확도를 높일 수 있음.

#4. 최신 인기 상품 추천 시스템
#최근 리뷰가 많이 달린 상품은 현재 사용자들에게 관심을 받고 있는 상품일 가능성이 높기때문에 최근 데이터를 기준으로 인기 상품을 추천함.
SELECT
  product_id,
  COUNT(*) AS review_count
FROM
  `project-c2dbf631-206a-40e8-a71.Day3.amazon`
GROUP BY
  product_id
ORDER BY
  review_count DESC
LIMIT 10;

# 카테고리 기반 인기 상춤 추천 시스템
#사용자가 특정 카테고리 상춤을 많이 구매하거나 검색하는 경우 해당 카테고리 내에서 인기 상품을 추천하는 방식으로 카테고리별 인기 상품을 제공하면 사용자 맞춤 추천이 용이하다.
SELECT
  category,
  product_id,
  COUNT(*) AS review_count
FROM
  `project-c2dbf631-206a-40e8-a71.Day3.amazon`
GROUP BY
  category, product_id
ORDER BY
  review_count DESC
LIMIT 10;
