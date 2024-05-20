# Gereksinim Dökümanı 

## 1.Proje Hedefi:
Restoranların QR kodlarını tek bir platformda toplamak, restoran ziyaretçileri için oldukça kullanışlı olabilir ve restoran sahipleri için de yönetim kolaylığı sağlayabilir.

## 2.Kapsam ve Özellikler:
Restoran sahiplerinin menüleri, kampanyaları, iletişim bilgileri gibi bilgileri QR kodlarına entegre etmelerini sağlayan bir arayüzdür.Restoranların kayıtlarını tutacak ve QR kodlarına ilişkin verileri yönetecek bir veri tabanı sistemi sağlar.

## 3.Kullanıcı Gereksinimleri:
Restoran menülerine ve kampanyalarına QR kodları aracılığıyla hızlıca erişme ihtiyacı. Menülerdeki ürünleri görüntüleme, fiyatları kontrol etme yeteneği.QR kodlarını mobil cihazlarıyla tarayarak restoran hakkında bilgi edinme ihtiyacı. Siparişlerini kolayca verebilmek için kullanıcı dostu bir arayüz talebi.

## 4.Teknoloji Gereksinimleri:
Projenin geliştirilmesinde Flutter framework'ü ve Dart programlama dili kullanılmıştır.Bu kombinasyon, hızlı ve performanslı bir şekilde kullanıcı dostu arayüzler oluşturmayı sağlar. Ayrıca, iletişim kanallarının güvence altına alınması ve veri bütünlüğünün korunması için HTTPS protokolü kullanılmıştır.
QR kodlarının yönetimi için, RESTful API'ler kullanılacaktır. Bu API'ler, restoran sahiplerinin menülerini, kampanyalarını ve iletişim bilgilerini QR kodlarına entegre etmelerini sağlayacak ve bu verilerin yönetimini kolaylaştıracaktır.
Projede Google Maps API gibi harita hizmetlerinden faydalanılacaktır. Bu, kullanıcıların restoranları harita üzerinde bulmalarını sağlayacak ve restoranların konumunu daha kolay erişilebilir kılacaktır. 
Ayrıca, projenin geliştirilmesinde Flutter'ın sunduğu diğer kütüphanelerden de faydalanılıp , bu kütüphaneler projenin işlevselliğini artırmak ve geliştirme sürecini hızlandırmak için kullanılmıştır.

## 5.Test Gereksinimleri: 
Restoran sahiplerinin menüleri, kampanyaları ve iletişim bilgilerini QR kodlarına entegre edebilmesi ve doğru bir şekilde yönetebilmesi test edilmiştir. QR kodlarının oluşturulması, güncellenmesi, silinmesi ve doğru şekilde çalıştığının doğrulanması gerekmektedir.Google Maps API'nin doğru bir şekilde entegre edilmiş olduğunu ve kullanıcıların restoranları harita üzerinde bulabildiğini doğrulamak için test edilmelmelidir.Restoranların konumlarının doğru bir şekilde gösterildiği ve kullanıcıların kolayca erişebildiği doğrulanmalıdır.

## 6.Dağıtım Planı:
Projenin dağıtım planı, öncelikle hazırlık aşamasıyla başlamıştır. Dönem proje ödevi olan bu projede iş paylaşımı ve yardımlaşma önemlidir. Projede geliştirilen mobil uygulama genel kullanıma açılacaktır. Teknolojik gereksinimler, test süreci ve sonuçları hakkında detaylı bir sunum gerçekleştirilecektir.Bu süreçte, projenin işletilmesi ve yönetimi devam edecek, hatalar düzeltilecek ve yeni özellikler eklenerek düzenli güncellemeler yayımlanacaktır.
