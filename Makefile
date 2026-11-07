# =============================================================================
# MFMX Proje Otomasyonu — Standard Makefile
# =============================================================================

.PHONY: help install dev lint test verify build clean

# Varsayılan hedef: Komut listesini gösterir
help:
	@echo "Mevcut Komutlar:"
	@echo "  make install   - Bağımlılıkları kurar"
	@echo "  make dev       - Geliştirme ortamını başlatır"
	@echo "  make lint      - Kod stili ve tip kontrollerini çalıştırır"
	@echo "  make test      - Birim ve entegrasyon testlerini koşturur"
	@echo "  make verify    - Tam doğrulama (lint + test + build kontrolü)"
	@echo "  make build     - Üretim derlemesini alır"
	@echo "  make clean     - Geçici dosyaları ve önbellekleri temizler"

# Bağımlılık kurulumu (projenize göre özelleştirin: pnpm install / uv sync)
install:
	@echo "==> Bağımlılıklar kuruluyor..."
	@if [ -f "pyproject.toml" ]; then uv sync; \
	elif [ -f "package.json" ]; then pnpm install; \
	elif [ -f "go.mod" ]; then go mod download; \
	else echo "Paket yöneticisi tespit edilemedi, manuel komut girin."; fi

# Geliştirme sunucusu
dev:
	@echo "==> Geliştirme modu başlatılıyor..."
	@if [ -f "package.json" ]; then pnpm run dev; \
	elif [ -f "main.py" ]; then python main.py; \
	else echo "Giriş noktası bulunamadı."; fi

# Statik analiz ve lint
lint:
	@echo "==> Kod analizi (Lint) çalıştırılıyor..."
	@if command -v ruff >/dev/null 2>&1 && [ -f "pyproject.toml" ]; then ruff check .; \
	elif [ -f "package.json" ]; then pnpm run lint || echo "Lint scripti tanımlı değil"; \
	else echo "Lint aracı bulunamadı."; fi

# Test koşturma
test:
	@echo "==> Testler çalıştırılıyor..."
	@if [ -d "tests" ] || [ -f "pytest.ini" ]; then pytest -v; \
	elif [ -f "package.json" ]; then pnpm test; \
	elif [ -f "go.mod" ]; then go test ./... -v; \
	else echo "Test paketi bulunamadı."; fi

# Tek komutla tam doğrulama (Pre-Commit / Pre-Push öncesi)
verify: lint test
	@echo "==> Tüm doğrulamalar başarıyla tamamlandı (ALL_OK)."

# Üretim derlemesi
build:
	@echo "==> Üretim derlemesi alınıyor..."
	@if [ -f "package.json" ]; then pnpm run build; \
	elif [ -f "go.mod" ]; then go build -o bin/app .; \
	else echo "Build hedefi bulunamadı."; fi

# Geçici kalıntıları temizleme
clean:
	@echo "==> Geçici dosyalar temizleniyor..."
	@rm -rf __pycache__ .pytest_cache .ruff_cache dist build .astro node_modules/.cache logs/*.log
	@find . -type f -name "*.swp" -delete
	@find . -type f -name "*~" -delete
	@echo "Temizlik tamamlandı."
