# King County: House Prices Prediction
**House Prices Prediction using Multiple Linear Regression**

RPubs: https://rpubs.com/gabrielerichson/kingcounty

***


## Intro
Tujuan dari project ini adalah untuk memprediksi penjualan rumah di King County, Washington, AS menggunakan metode Linear Regression. Dataset terdiri dari data historis rumah yang dijual antara Mei 2014 hingga Mei 2015. Data yang digunakan dapat didownload dari [KC_Housesales_Data](https://www.kaggle.com/swathiachath/kc-housesales-data)


## Summary

Model ini memiliki nilai **Adjusted R-squared : 0.7134 **, hal ini menandakan bahwa model lm_house_all dapat memprediksi **71.3%**. Kemudian Hasil pengujian error menggunakan metode MAE menunjukan error kurang lebih sekitar **USD 106.946**. Pada pengujian asumsi, model ini hanya berhasil melewati pengujian Multicollinearity sedangkan pada gagal dalam pengujian Linearity, Normality dan Heteroscedasticity. Kesimpulannya, model ini masih kurang baik jika hendak digunakan untuk memprediksi harga rumah terkait dataset ini. Saya akan coba melakukan tunning atau menggunakan metode lainnya di kesempatan selanjutnya.

