Öğrenci Verimi Bulanık Mantık Sistemi
Bu depo, öğrenci verimini değerlendirmek için tasarlanmış bir Bulanık Mantık Sistemi (Fuzzy Logic System) içeren MATLAB kodlarını barındırmaktadır. Sistem, öğrencinin Çalışma Süresi, Devamsızlık ve Özel Ders gibi giriş değişkenlerini kullanarak Sınav Başarısı ve Öğrenci Verimi çıktılarını bulanık mantık kuralları ile hesaplar.

İçerik
fuzzy.m: Bulanık mantık sisteminin tanımlandığı ve kurallarının belirlendiği ana MATLAB kodu.

fuzzyworkspace.mat: Bulanık mantık sistemi ile ilgili kaydedilmiş çalışma alanı (eğer load("fuzzyworkspace.mat") kodu gerçekten çalışıyorsa).

Nasıl Çalışır?
fuzzy.m scripti aşağıdaki adımları gerçekleştirir:

MAMFIS Oluşturma: mamfis fonksiyonu ile yeni bir bulanık çıkarım sistemi (OgrenciVerimi) oluşturulur.

Giriş Değişkenleri Tanımlama:
Çalışma Süresi: [0 20] aralığında. Üyelik fonksiyonları: dusuk, orta, yuksek, cok_yuksek.
Devamsızlık: [0 29] aralığında. Üyelik fonksiyonları: dusuk, orta, yuksek, cok_yuksek.
Özel Ders: [0 5] aralığında. Üyelik fonksiyonları: dusuk, yuksek.
Ebeveyn Desteği: [0 4] aralığında. Üyelik fonksiyonları: dusuk, orta, yuksek.
Gönüllülük: [0 1] aralığında. Üyelik fonksiyonları: dusuk, yuksek.

Çıkış Değişkenleri Tanımlama:
Ortalama: [0 4] aralığında. Üyelik fonksiyonları: cok_dusuk, dusuk, orta, yuksek, cok_yuksek.

Kurallar Tanımlama: Sistem, giriş değişkenlerinin farklı kombinasyonlarına göre çıktıları belirleyen kapsamlı bir bulanık kural setine sahiptir. Bu kurallar öğrencinin çalışma süresi, devamsızlığı ve özel ders alıp almamasına göre sınav başarısı ve genel verimini tahmin etmeye çalışır.
Kullanım
MATLAB yazılımını bilgisayarınıza kurun.
fuzzy.m dosyasını MATLAB ortamında açın.
Kodu çalıştırmak için MATLAB komut penceresine fuzzy yazın veya "Run" butonuna tıklayın.
Kod çalıştırıldığında, tanımlanan bulanık mantık sistemi MATLAB çalışma alanında oluşturulacak ve kullanılabilir hale gelecektir. evalfis fonksiyonunu kullanarak yeni giriş değerleri ile sistemi test edebilirsiniz.

Örnek Kullanım (MATLAB Komut Penceresinde):
Matlab
% fuzzy.m dosyasını çalıştırdıktan sonra
% Öğrenci Verimi sistemini alın (adı 'fzy' olarak tanımlanmıştır)
% Eğer kodunuzda farklı bir isim kullanıyorsanız o ismi girin
% Örnek giriş değerleri: CalismaSuresi = 15, Devamsizlik = 5, OzelDers = 1
input_values = [15 5 1];
% Sistemden çıkış değerlerini hesaplayın
output = evalfis(fzy, input_values);


Not:
load("fuzzyworkspace.mat") satırı, eğer bu dosya mevcut değilse veya doğru yolda değilse hata verebilir. Bu dosyanın ne amaçla kullanıldığını ve içeriğini kontrol etmeniz gerekebilir.
Lisans bilgisi eklemek, projenizin başkaları tarafından nasıl kullanılabileceğini veya dağıtılabileceğini belirlemek için önemlidir.
Bu taslak, projeniz hakkında temel bilgileri ve nasıl kullanılabileceğini açıkça belirtmek için iyi bir başlangıç noktası olacaktır. Eksik veya eklemek istediğiniz bilgiler varsa bana bildirin, düzenlemeler yapabilirim.
