phony: clean gen fix

clean:
	@echo "╠ Cleaning project..."
	flutter clean
	@echo "╠ Get dependencies..."
	flutter pub get

gen:
	@echo "╠ Running generator..."
	flutter pub run build_runner build --delete-conflicting-outputs

gen_l10n:
	@echo "╠ Generating translations..."
	flutter pub run intl_utils:generate

gen_icon:
	@echo "╠ Generating icons..."
	flutter pub run flutter_launcher_icons

gen_splash:
	@echo "╠ Generating splash..."
	dart run flutter_native_splash:create

fix:
	@echo "╠ Applying fix..."
	dart fix

fix_gen:
	@echo "╠ Fixing gen..."
	mkdir ./.dart_tool/flutter_gen
	echo "version: 1.0.0" > ./.dart_tool/flutter_gen/pubspec.yaml
