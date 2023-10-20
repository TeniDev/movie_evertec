phony: clean gen fix

clean:
	@echo "╠ Cleaning project..."
	flutter clean
	@echo "╠ Get dependencies..."
	flutter pub get

gen:
	@echo "╠ Running generator..."
	flutter packages pub run build_runner build --delete-conflicting-outputs

fix:
	@echo "╠ Applying fix..."
	dart fix