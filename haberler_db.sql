-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 31 May 2024, 19:46:27
-- Sunucu sürümü: 10.4.32-MariaDB
-- PHP Sürümü: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `haberler_db`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `haber_tablo`
--

CREATE TABLE `haber_tablo` (
  `haber_id` int(11) NOT NULL,
  `kategori_id` int(11) NOT NULL,
  `haber_baslik` varchar(100) NOT NULL,
  `haber_icerik` text DEFAULT NULL,
  `yazar_id` int(11) NOT NULL,
  `haber_tarih` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kategori_tablo`
--

CREATE TABLE `kategori_tablo` (
  `kategori_id` int(11) NOT NULL,
  `kategori_adi` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `kategori_tablo`
--

INSERT INTO `kategori_tablo` (`kategori_id`, `kategori_adi`) VALUES
(2, 'deneme1');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yazar_tablo`
--

CREATE TABLE `yazar_tablo` (
  `yazar_id` int(11) NOT NULL,
  `yazar_eposta` varchar(50) NOT NULL,
  `yazar_sifre` varchar(50) NOT NULL,
  `yazar_adsoyad` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `yazar_tablo`
--

INSERT INTO `yazar_tablo` (`yazar_id`, `yazar_eposta`, `yazar_sifre`, `yazar_adsoyad`) VALUES
(3, 'naber@test.com', 'naber123', 'naber');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `haber_tablo`
--
ALTER TABLE `haber_tablo`
  ADD PRIMARY KEY (`haber_id`),
  ADD KEY `kategori_id` (`kategori_id`),
  ADD KEY `yazar_id` (`yazar_id`);

--
-- Tablo için indeksler `kategori_tablo`
--
ALTER TABLE `kategori_tablo`
  ADD PRIMARY KEY (`kategori_id`);

--
-- Tablo için indeksler `yazar_tablo`
--
ALTER TABLE `yazar_tablo`
  ADD PRIMARY KEY (`yazar_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `haber_tablo`
--
ALTER TABLE `haber_tablo`
  MODIFY `haber_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `kategori_tablo`
--
ALTER TABLE `kategori_tablo`
  MODIFY `kategori_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `yazar_tablo`
--
ALTER TABLE `yazar_tablo`
  MODIFY `yazar_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `haber_tablo`
--
ALTER TABLE `haber_tablo`
  ADD CONSTRAINT `haber_tablo_ibfk_1` FOREIGN KEY (`kategori_id`) REFERENCES `kategori_tablo` (`kategori_id`),
  ADD CONSTRAINT `haber_tablo_ibfk_2` FOREIGN KEY (`yazar_id`) REFERENCES `yazar_tablo` (`yazar_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
