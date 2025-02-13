


-- Ən bahalı modellərin müəyyən edilməsi
SELECT
    model,
    COUNT(*),
    round(AVG(qiymet)) AS ortalama_qiymet
FROM
    turbo_az_mercedes
GROUP BY
    model, COUNT(*)
ORDER BY
    ortalama_qiymet DESC
FETCH FIRST 5 ROWS ONLY;


-- İstifadə olunmuş və yeni avtomobillərin müqayisəsi
SELECT
    yeni,
    COUNT(*)           AS avtomobil_sayi,
    round(AVG(qiymet)) AS ortalama_qiymet
FROM
    turbo_az_mercedes
GROUP BY
    yeni;


-- Şəhər üzrə satış statistikası
SELECT
    sheher,
    COUNT(*)           AS avtomobil_sayi,
    round(AVG(qiymet)) AS ortalama_qiymet
FROM
    turbo_az_mercedes
GROUP BY
    sheher
ORDER BY
    avtomobil_sayi DESC;


-- Benzin tipi üzrə təhlil
SELECT
    benzin_tipi,
    COUNT(*)           AS avtomobil_sayi,
    round(AVG(qiymet)) AS ortalama_qiymet
FROM
    turbo_az_mercedes
GROUP BY
    benzin_tipi;


-- Avtomobillərin buraxılış ili ilə bağlı trend analizləri
SELECT
    buraxilish_ili,
    COUNT(*)           AS avtomobil_sayi,
    round(AVG(qiymet)) AS ortalama_qiymet
FROM
    turbo_az_mercedes
GROUP BY
    buraxilish_ili
ORDER BY
    ortalama_qiymet;


-- Rənglər üzrə avtomobil seçimi
SELECT
    reng,
    COUNT(*) AS avtomobil_sayi
FROM
    turbo_az_mercedes
GROUP BY
    reng
ORDER BY
    avtomobil_sayi DESC;


-- Avtomobillərin yürüşü ilə qiyməti arasındakı əlaqənin müəyyən edilməsi
SELECT
    marka,
    model,
    yurush,
    qiymet
FROM
    turbo_az_mercedes
ORDER BY
    yurush;


-- Qiymət üzrə ən çox baxılan elanlar
SELECT
    *
FROM
    turbo_az_mercedes
ORDER BY
    elana_baxish_sayi DESC
FETCH FIRST 10 ROWS ONLY;

--------------------------------------------------------------

-- Mühərrik həcmi və at gücü ilə qiymət arasında korelyasiya
SELECT
    muherrik_hecmi,
    at_gucu,
    COUNT(*),
    round(AVG(qiymet)) AS ortalama_qiymet
FROM
    turbo_az_mercedes
GROUP BY
    muherrik_hecmi,
    at_gucu
HAVING
    COUNT(*) > 1
ORDER BY
    ortalama_qiymet DESC;


-- Benzin tipinə görə avtomobillərin qiymət və baxış sayının müqayisəsi
SELECT
    benzin_tipi,
    round(AVG(qiymet))            AS ortalama_qiymet,
    round(AVG(elana_baxish_sayi)) AS ortalama_baxish
FROM
    turbo_az_mercedes
GROUP BY
    benzin_tipi
ORDER BY
    ortalama_qiymet DESC;


-- Rəngə görə ən bahalı avtomobillər
SELECT
    reng,
    MAX(qiymet) AS en_yuksek_qiymet
FROM
    turbo_az_mercedes
GROUP BY
    reng
ORDER BY
    en_yuksek_qiymet DESC;


-- Buraxılış ili üzrə avtomobillərin qiymət artımı
SELECT
    buraxilish_ili,
    round(AVG(qiymet)) AS ortalama_qiymet
FROM
    turbo_az_mercedes
GROUP BY
    buraxilish_ili
ORDER BY
    ortalama_qiymet ASC;


-- Sürət qutusu tipinə görə avtomobil müqayisəsi
SELECT
    suretler_qutusu,
    COUNT(*)               AS avtomobil_sayi,
    round(AVG(qiymet))     AS ortalama_qiymet,
    SUM(elana_baxish_sayi) AS umumi_baxish_sayi
FROM
    turbo_az_mercedes
GROUP BY
    suretler_qutusu
ORDER BY
    avtomobil_sayi DESC;


-- Yeni avtomobillərin məkan üzrə qiymət fərqləri
SELECT
    sheher,
    round(AVG(qiymet)) AS ortalama_qiymet
FROM
    turbo_az_mercedes
WHERE
    yeni = 'B?li'
GROUP BY
    sheher
ORDER BY
    ortalama_qiymet DESC;


-- Vəziyyəti yaxşı olan avtomobillərin statistikası
SELECT
    veziyyeti,
    COUNT(*)               AS avtomobil_sayi,
    round(AVG(qiymet))     AS ortalama_qiymet,
    SUM(elana_baxish_sayi) AS umumi_baxish
FROM
    turbo_az_mercedes
WHERE
    veziyyeti LIKE '%yoxdur%'
GROUP BY
    veziyyeti
ORDER BY
    avtomobil_sayi DESC;


-- At gücünə görə avtomobillərin performansının qiymətləndirilməsi
SELECT
    at_gucu,
    COUNT(*)               AS avtomobil_sayi,
    round(AVG(qiymet))     AS ortalama_qiymet,
    SUM(elana_baxish_sayi) AS umumi_baxish
FROM
    turbo_az_mercedes
WHERE
    at_gucu > 300
GROUP BY
    at_gucu
ORDER BY
    umumi_baxish DESC;


-- Avtomobillərin yürüşə görə qiymətləndirilməsi
SELECT
    yurush,
    COUNT(*)           AS avtomobil_sayi,
    round(AVG(qiymet)) AS ortalama_qiymet
FROM
    turbo_az_mercedes
GROUP BY
    yurush
ORDER BY
    yurush ASC;


-- Qiymətə görə ən populyar modellər və modellərin populyarlıq dəyişiklikləri
SELECT
    model,
    COUNT(*)                      AS elan_sayi,
    round(AVG(qiymet))            AS ortalama_qiymet,
    round(AVG(elana_baxish_sayi)) AS ortalama_baxish
FROM
    turbo_az_mercedes
GROUP BY
    model
HAVING
    COUNT(*) > 5  -- ən azı 5 elan olan modelləri göstərmək üçün
ORDER BY
    ortalama_baxish DESC;


-- Buraxılış ili və mühərrik həcminə görə qiymət və performans analizi
SELECT
    buraxilish_ili,
    muherrik_hecmi,
    COUNT(*)            AS elan_sayi,
    round(AVG(qiymet))  AS ortalama_qiymet,
    round(AVG(at_gucu)) AS ortalama_at_gucu
FROM
    turbo_az_mercedes
GROUP BY
    buraxilish_ili,
    muherrik_hecmi
HAVING
    COUNT(*) > 2  -- ən azı 2 elan olan qrupları göstərmək üçün
ORDER BY
    buraxilish_ili DESC,
    muherrik_hecmi DESC;


-- Yeni və istifadə olunmuş avtomobillərin rənglər üzrə qiymət müqayisəsi
SELECT
    reng,
    yeni,
    COUNT(*)           AS avtomobil_sayi,
    round(AVG(qiymet)) AS ortalama_qiymet
FROM
    turbo_az_mercedes
GROUP BY
    reng,
    yeni
ORDER BY
    reng,
    yeni;


-- Model, şəhər və buraxılış ilinə görə kompleks təhlil
SELECT
    model,
    sheher,
    buraxilish_ili,
    COUNT(*)                      AS avtomobil_sayi,
    round(AVG(qiymet))            AS ortalama_qiymet,
    round(AVG(elana_baxish_sayi)) AS ortalama_baxish
FROM
    turbo_az_mercedes
GROUP BY
    model,
    sheher,
    buraxilish_ili
HAVING
    COUNT(*) > 1  -- ən azı 1 elan olan qrupları göstərmək üçün
ORDER BY
    model,
    sheher,
    buraxilish_ili;


-- Yürüşə və benzin tipinə görə qiymət analizi
SELECT
    yurush,
    benzin_tipi,
    COUNT(*)           AS avtomobil_sayi,
    round(AVG(qiymet)) AS ortalama_qiymet
FROM
    turbo_az_mercedes
GROUP BY
    yurush,
    benzin_tipi
HAVING
    COUNT(*) > 2  -- ən azı 1 elan olan qrupları göstərmək üçün
ORDER BY
    yurush ASC,
    benzin_tipi ASC;


-- Avtomobil modellərinin populyarlığının ilbəil dəyişməsi
SELECT
    model,
    buraxilish_ili,
    COUNT(*)                      AS elan_sayi,
    round(AVG(elana_baxish_sayi)) AS ortalama_baxish
FROM
    turbo_az_mercedes
GROUP BY
    model,
    buraxilish_ili
HAVING
    COUNT(*) > 1  -- ən azı 1 elan olan modelləri göstərmək üçün
ORDER BY
    model,
    buraxilish_ili DESC;


-- Avtomobilin vəziyyətinin qiymətə təsiri
SELECT
    veziyyeti,
    COUNT(*)               AS avtomobil_sayi,
    round(AVG(qiymet))     AS ortalama_qiymet,
    SUM(elana_baxish_sayi) AS ortalama_baxish
FROM
    turbo_az_mercedes
GROUP BY
    veziyyeti
HAVING
    COUNT(*) > 1  -- ən azı 1 elan olan qrupları göstərmək üçün
ORDER BY
    ortalama_qiymet DESC;


-- Buraxılış ili, model və mühərrik həcmi üzrə qiymət analizi
SELECT
    buraxilish_ili,
    model,
    muherrik_hecmi,
    COUNT(*)           AS avtomobil_sayi,
    round(AVG(qiymet)) AS ortalama_qiymet
FROM
    turbo_az_mercedes
GROUP BY
    buraxilish_ili,
    model,
    muherrik_hecmi
HAVING
    COUNT(*) > 1  -- ən azı 1 elan olan qrupları göstərmək üçün
ORDER BY
    buraxilish_ili DESC,
    model,
    muherrik_hecmi;
    
    
    
SELECT
    model,
    yeni,
    qiymet,
    ROW_NUMBER()
    OVER(PARTITION BY model
         ORDER BY
             yeni DESC, qiymet DESC
    ) AS row_num
FROM
    turbo_az_mercedes




