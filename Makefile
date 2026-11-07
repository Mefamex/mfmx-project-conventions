# =============================================================================
# [Proje Adı] — Makefile
#
# Kendi kendini belgeleyen (Self-documenting) görev yöneticisi.
# Terminalde sadece 'make' yazıldığında kullanılabilir komutları renkli listeler.
#
# ⚠️ ZORUNLU YAŞAM DÖNGÜSÜ HEDEFLERİ:
# Her projenin Makefile'ında şu 6 hedef KESİNLİKLE bulunmalıdır:
# [install, reinstall, update, run, clean, remove]
# =============================================================================

.DEFAULT_GOAL := help
.PHONY: help install reinstall update run dev lint test verify build clean remove

help: ## Mevcut komutları ve açıklamalarını listeler
	@echo "Kullanım: make [komut]"
	@echo ""
	@echo "Kullanılabilir Komutlar:"
	@LC_ALL=C grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-14s\033[0m %s\n", $$1, $$2}'

# --- 1. KURULUM & YAŞAM DÖNGÜSÜ (Zorunlu Hedefler) ---

install: ## Bağımlılıkları ilk kez kurar (pnpm install / uv sync / go mod download)
	@echo "==> Bağımlılıklar yükleniyor..."
	# [Kurulum komutunu buraya yazın]

reinstall: remove install ## Kurulu ortamı kaldırıp sıfırdan tertemiz yeniden kurar
	@echo "==> Temiz yeniden kurulum tamamlandı."

update: ## Bağımlılıkları ve kütüphaneleri en son kararlı sürüme günceller
	@echo "==> Bağımlılıklar güncelleniyor..."
	# [pnpm update / uv lock --upgrade / go get -u ./...]

remove: ## Kurulu bağımlılıkları, sanal ortamı ve çıktıları tamamen kazır
	@echo "==> Ortam ve bağımlılıklar kaldırılıyor..."
	rm -rf node_modules .venv venv dist build
	@echo "Kaldırma işlemi tamamlandı."

# --- 2. ÇALIŞTIRMA & GELİŞTİRME ---

run: ## Uygulamayı / ana betiği doğrudan çalıştırır
	@echo "==> Program çalıştırılıyor..."
	# [python main.py / node index.js / go run .]

dev: ## Yerel geliştirme ortamını / sunucuyu izleme modunda başlatır
	@echo "==> Geliştirme modu başlatılıyor..."
	# [Geliştirme sunucusu komutunu buraya yazın]

# --- 3. DENETİM & DOĞRULAMA ---

lint: ## Kod stili, sözdizimi ve tip denetimlerini çalıştırır
	@echo "==> Statik kod analizi yapılıyor..."
	# [ruff check . / pnpm run lint / astro check / shellcheck]

test: ## Birim ve entegrasyon testlerini koşturur
	@echo "==> Testler çalıştırılıyor..."
	# [pytest -v / pnpm test / go test ./...]

verify: lint test ## Commit/Push öncesi tam doğrulama zincirini çalıştırır (lint + test)
	@echo "==> Tüm kontroller başarıyla tamamlandı (ALL_OK)."

# --- 4. DERLEME & TEMİZLİK ---

build: ## Üretim derlemesini alır (dist / build / binary)
	@echo "==> Üretim derlemesi alınıyor..."
	# [pnpm run build / uv build / go build]

clean: ## Geçici dosyaları, derleme çıktılarını ve önbellekleri temizler
	@echo "==> Kalıntılar temizleniyor..."
	find . -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null || true
	rm -rf dist build .pytest_cache .ruff_cache logs/*.log
	@echo "Temizlik tamamlandı."

# =============================================================================
# 🧭 NE ZAMAN HANGİ KOMUT? (Ajan & Geliştirici Kılavuzu)
#
# 1. Projeyi taze klonlayınca  : make install
# 2. Çalıştırmak için          : make run (veya geliştirme için: make dev)
# 3. Paket güncellemesinde     : make update
# 4. Sorun giderme / sıfırlama : make reinstall (ortamı tertemiz baştan kurar)
# 5. Kod değiştikten sonra     : make lint
# 6. Commit ve push öncesi     : make verify (lint + test geçmek ZORUNDADIR)
# 7. Dağıtım öncesi derleme    : make build
# 8. Ortamı temizleme          : make clean (veya tamamen kaldırmak için: make remove)
# =============================================================================
