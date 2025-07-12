# Öğrenci Verimi Bulanık Mantık Sistemi

Bu depo, öğrenci verimini değerlendirmek için tasarlanmış bir Bulanık Mantık Sistemi (Fuzzy Logic System) içeren MATLAB kodlarını barındırmaktadır. Sistem, öğrencinin Çalışma Süresi, Devamsızlık, Özel Ders, Ebeveyn Desteği ve Gönüllülük gibi giriş değişkenlerini kullanarak Sınav Başarısı ve Öğrenci Verimi gibi çıktıları bulanık mantık kuralları ile hesaplar.

## İçindekiler

1.  [Proje Hakkında](#proje-hakkında)
2.  [İçerik](#içerik)
3.  [Nasıl Çalışır?](#nasıl-çalışır)
4.  [Kullanım](#kullanım)
5.  [Örnek Kullanım](#örnek-kullanım)
6.  [Notlar](#notlar)
7.  [Kullanılan Teknolojiler](#kullanılan-teknolojiler)

---

## Proje Hakkında

Bu proje, bulanık mantık prensiplerini kullanarak öğrenci performansını nicel olarak değerlendirmeyi amaçlar. Geleneksel keskin mantık yerine, gerçek dünyadaki belirsizlikleri ve karmaşıklığı daha iyi modelleyebilen bulanık mantık yakılımını benimser. Eğitim, devamsızlık gibi faktörlerin bir öğrencinin başarısı üzerindeki etkisini esnek bir şekilde analiz eder.

## İçerik

* **`fuzzy.m`**: Bulanık mantık sisteminin tanımlandığı, giriş/çıkış değişkenlerinin ve üyelik fonksiyonlarının belirlendiği, ayrıca kapsamlı bulanık kurallarının kodlandığı ana MATLAB script dosyası.
* **`fuzzyworkspace.mat`**: Bulanık mantık sistemi ile ilgili kaydedilmiş çalışma alanı dosyası. (Eğer `load("fuzzyworkspace.mat")` kodu gerçekten çalışıyorsa veya bu dosya mevcutsa kullanılır.)

## Nasıl Çalışır?

`fuzzy.m` scripti aşağıdaki temel adımları gerçekleştirir:

1.  **MAMFIS Oluşturma**:
    * `mamfis` fonksiyonu ile yeni bir Mamdani tipi bulanık çıkarım sistemi (`OgrenciVerimi`) oluşturulur.

2.  **Giriş Değişkenleri Tanımlama**:
    * **Çalışma Süresi**: `[0 20]` aralığında. Üyelik fonksiyonları: `dusuk`, `orta`, `yuksek`, `cok_yuksek`.
    * **Devamsızlık**: `[0 29]` aralığında. Üyelik fonksiyonları: `dusuk`, `orta`, `yuksek`, `cok_yuksek`.
    * **Özel Ders**: `[0 5]` aralığında. Üyelik fonksiyonları: `dusuk`, `yuksek`.
    * **Ebeveyn Desteği**: `[0 4]` aralığında. Üyelik fonksiyonları: `dusuk`, `orta`, `yuksek`.
    * **Gönüllülük**: `[0 1]` aralığında. Üyelik fonksiyonları: `dusuk`, `yuksek`.

3.  **Çıkış Değişkenleri Tanımlama**:
    * **Ortalama**: `[0 4]` aralığında. Üyelik fonksiyonları: `cok_dusuk`, `dusuk`, `orta`, `yuksek`, `cok_yuksek`.

4.  **Kurallar Tanımlama**:
    * Sistem, giriş değişkenlerinin farklı kombinasyonlarına göre çıktıları belirleyen kapsamlı bir bulanık kural setine sahiptir. Bu kurallar öğrencinin çalışma süresi, devamsızlığı, özel ders alıp almaması, ebeveyn desteği ve gönüllülük durumuna göre genel verimini tahmin etmeye çalışır.

## Kullanım

Projeyi çalıştırmak için aşağıdaki adımları izleyin:

1.  **MATLAB yazılımını** bilgisayarınıza kurun.
2.  `fuzzy.m` dosyasını ve (varsa) `fuzzyworkspace.mat` dosyasını MATLAB ortamınızın erişebileceği bir dizine yerleştirin.
3.  MATLAB ortamında `fuzzy.m` dosyasını açın.
4.  Kodu çalıştırmak için MATLAB komut penceresine `fuzzy` yazın ve `Enter` tuşuna basın veya MATLAB arayüzündeki "Run" butonuna tıklayın.

Kod çalıştırıldığında, tanımlanan bulanık mantık sistemi MATLAB çalışma alanında `fzy` değişkeni olarak oluşturulacak ve kullanılabilir hale gelecektir. `evalfis` fonksiyonunu kullanarak yeni giriş değerleri ile sistemi test edebilirsiniz.

## Örnek Kullanım (MATLAB Komut Penceresinde)

`fuzzy.m` dosyasını çalıştırdıktan sonra aşağıdaki komutları kullanarak sistemden çıktı alabilirsiniz:

```matlab
% Örnek giriş değerleri:
% CalismaSuresi = 15 (ortalama), Devamsizlik = 5 (düşük), OzelDers = 1 (evet)
% EbeveynDestegi = 3 (yüksek), Gonulluluk = 1 (yüksek)
input_values = [15 5 1 3 1];

% Sistemden çıkış değerlerini hesaplayın
output = evalfis(fzy, input_values);

% Çıktıyı görüntüle
disp(['Hesaplanan Ortalama: ', num2str(output)]);
