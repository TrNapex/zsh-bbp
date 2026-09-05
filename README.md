# 🚀 zsh-bbp (Basic But Pretty)

📌 **[For English description, click here.](#English)**

---

> **Zsh terminaliniz için hızlı, korumalı, renkli ve Türkçe/İngilizce destekli yapılandırma scripti.**

> [!Note] 
> ***Sadece Linux & Termux ortamları için geliştirildi ve test edildi.***

## 🌟 Öne Çıkan Özellikler / Features
 * 🛡️ **SecFF (Security Folder & File):** rm ve mv komutlarını korumaya alarak önemli dosya ve klasörlerin yanlışlıkla silinmesini engeller.
 * 📂 **sf Komutu (Smart Lister):** Klasörleri ve dosyaları yan yana düzenli sütunlar halinde gösterir.
 * ⏱️ **Ultra Hızlı Komut Süresi:** Zsh dahili modülü (zsh/datetime) ile çalışan gecikmesiz süre hesaplama.
 * 🌿 **Git Entegrasyonu:** Bulunduğunuz dizindeki Git dalını (branch) anında prompt üzerinde gösterir.
 * 🌍 **Çift Dil Desteği (TR/ENG):** İlk açılışta dilinizi seçin veya lang-reset ile dilediğiniz zaman değiştirin.
 * 📦 **Tek Tıkla Eklenti Kurulumu:** zsh-autosuggestions ve zsh-syntax-highlighting eklentilerini kur (veya setup) komutuyla yükleyin.
## 📦 Kurulum / Installation
 1. Projeyi klonlayın ve klasöre girin:
   ```zsh
   git clone https://github.com/TrNapex/zsh-bbp.git
   cd zsh-bbp

   ```
 2. Terminalde kurulum fonksiyonunu çalıştırın:
   ```zsh
   bbp_start

   ```
***bbp_start komutu gerekli yapılandırmayı ~/.zshrc dosyanıza ekler ve kurulum bittikten sonra kendini otomatik olarak temizler.***

---

## 🚀 Kullanım ve Komutlar / Commands
| Komut / Command | Açıklama (TR) | Description (ENG) |
|---|---|---|
| **sec <dosya/klasör>** | Belirtilen öğeyi korumaya alır. | Protects the file/folder from deletion. |
| **unsec <dosya/klasör>** | Koruma listesinden çıkarır. | Removes protection from the file/folder. |
| **sf** | Dosya ve klasörleri 2 sütunlu şık görünümde listeler. | Displays files and folders in clean columns. |
| **kur** / **setup** | Otomatik tamamlama & renklendirme eklentilerini kurar. | Installs auto-suggestions & syntax highlighting. |
| **plugins-installed-by-bbp** | Eklenti kurulum durumunu gösterir. | Shows status of installed plugins. |
| **lang-reset** | Dil seçim ekranını sıfırlar. | Resets language selection. |
| **bbp spc** | Özel komutlar rehberini açar. | Displays special commands guide. |
## 🛡️ SecFF Güvenlik Mantığı
sec dosyam.txt komutu ile bir dosyayı korumaya aldığınızda:
 1. rm dosyam.txt yazdığınızda terminal sizi uyarır ve onay ister ([y/N]).
 2. mv dosyam.txt yeni_yol/ yaptığınızda dosyanın koruma altındaki yolu otomatik olarak güncellenir.
## 🗺️ Gelecek Planları / Roadmap (v2.0)
This is **v1.0 (Basic But Pretty)**.
 * ⚡ **C++ Core (v2.0):** Eğer ilgi görürse, prompt performansını en üst seviyeye çıkarmak için çekirdeği C++ ile yeniden yazacağım.
 * 🛡️ **SecFF Standalone:** SecFF güvenlik sistemini ayrı ve gelişmiş bir proje olarak sunmayı planlıyorum.

## Notlar
BbP yapılırken yapay zekadan yardım alındı. Algoritma, çalışma prensibi tamamen benim tarafımdan yazıldı. Çalıştıp çalışmadığı defalarca test edildi.


---

## English
# 🚀 zsh-bbp (Basic But Pretty)
> **Modern, lightweight, safe, and aesthetic setup for Zsh.**
> A fast, protected, colorful Zsh configuration script with Turkish/English support.

> [!Note]
> Designed and tested **Only for Linux & Termux** environments.

## 🌟 Key Features
 * 🛡️ **SecFF (Security Folder & File):** Protects your files and folders from accidental deletion by safely overriding `rm` and `mv`.
 * 📂 **sf Command (Smart Lister):** Displays files and folders neatly in side-by-side columns.
 * ⏱️ **Ultra-Fast Command Duration:** Lag-free execution time tracking powered by Zsh's built-in module (`zsh/datetime`).
 * 🌿 **Git Integration:** Instantly displays your current Git branch directly on the prompt.
 * 🌍 **Dual Language Support (TR/ENG):** Select your preferred language on first launch, or change it anytime using `lang-reset`.
 * 📦 **One-Click Plugin Installation:** Easily install `zsh-autosuggestions` and `zsh-syntax-highlighting` using the `kur` or `setup` command.

## 📦 Installation
 1. Clone the repository and navigate into the directory:
   ```zsh
  git clone https://github.com/TrNapex/zsh-bbp.git
   cd zsh-bbp

```
 2. Run the setup function in your terminal:
```zsh
bbp_start

```
***The bbp_start command appends the required configuration to your ~/.zshrc file and automatically cleans itself up once completed.***
## 🚀 Usage & Commands
| Command | Description |
|---|---|
| **sec <file/folder>** | Protects the specified item from deletion. |
| **unsec <file/folder>** | Removes protection from the file/folder. |
| **sf** | Displays files and folders in a clean 2-column layout. |
| **kur** / **setup** | Installs auto-suggestions & syntax highlighting plugins. |
| **plugins-installed-by-bbp** | Displays the installation status of plugins. |
| **lang-reset** | Resets the language selection menu. |
| **bbp spc** | Opens the special commands guide. |
## 🛡️ SecFF Security Logic
When you protect a file using sec myfile.txt:
 1. Running rm myfile.txt prompts a warning and asks for confirmation ([y/N]).
 2. Running mv myfile.txt new_path/ automatically updates the protected path of the file.
## 🗺️ Roadmap (v2.0)
This is **v1.0 (Basic But Pretty)**.
 * ⚡ **C++ Core (v2.0):** If there is enough interest, I plan to rewrite the core in C++ to maximize prompt performance.
 * 🛡️ **SecFF Standalone:** I plan to release the SecFF security system as an independent, enhanced standalone project.

## Notes
Artificial intelligence was used as an assistant during the development of BbP. However, the overall algorithm and core working principles were written entirely by me. Its functionality has been thoroughly tested and verified multiple times.
