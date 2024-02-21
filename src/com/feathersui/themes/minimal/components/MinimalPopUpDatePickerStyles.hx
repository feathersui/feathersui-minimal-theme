/*
	feathersui-minimal-theme
	Copyright 2024 Bowler Hat LLC. All Rights Reserved.

	This program is free software. You can redistribute and/or modify it in
	accordance with the terms of the accompanying license agreement.
 */

package com.feathersui.themes.minimal.components;

import com.feathersui.themes.minimal.skins.MinimalButtonSkin;
import feathers.controls.Button;
import feathers.controls.ButtonState;
import feathers.controls.DatePicker;
import feathers.controls.PopUpDatePicker;
import feathers.controls.TextInput;
import feathers.skins.RectangleSkin;
import feathers.style.Theme;
import openfl.display.Shape;

/**
	Initialize "minimal" styles for the `PopUpDatePicker` component.

	@since 1.0.0
**/
@:dox(hide)
@:access(com.feathersui.themes.minimal.BaseMinimalTheme)
class MinimalPopUpDatePickerStyles {
	public static function initialize(?theme:BaseMinimalTheme):Void {
		if (theme == null) {
			theme = Std.downcast(Theme.fallbackTheme, BaseMinimalTheme);
		}
		if (theme == null) {
			return;
		}
		var styleProvider = theme.styleProvider;
		if (styleProvider.getStyleFunction(Button, PopUpDatePicker.CHILD_VARIANT_BUTTON) == null) {
			styleProvider.setStyleFunction(Button, PopUpDatePicker.CHILD_VARIANT_BUTTON, function(button:Button):Void {
				if (button.backgroundSkin == null) {
					var backgroundSkin = new MinimalButtonSkin(theme);
					backgroundSkin.width = 16.0;
					backgroundSkin.height = 16.0;
					button.backgroundSkin = backgroundSkin;
				}
				if (button.icon == null) {
					var icon = new Shape();
					drawIcon(icon, theme.labelTextColor);
					button.icon = icon;

					if (button.getIconForState(ButtonState.DISABLED) == null) {
						var disabledIcon = new Shape();
						drawIcon(disabledIcon, theme.labelTextDisabledColor);
						button.setIconForState(ButtonState.DISABLED, disabledIcon);
					}
				}
				if (button.textFormat == null) {
					button.textFormat = theme.getTextFormat();
				}
				button.embedFonts = theme.embedFonts;
				button.gap = 2.0;
				button.setPadding(2.0);
			});
		}
		if (styleProvider.getStyleFunction(TextInput, PopUpDatePicker.CHILD_VARIANT_TEXT_INPUT) == null) {
			styleProvider.setStyleFunction(TextInput, PopUpDatePicker.CHILD_VARIANT_TEXT_INPUT, function(textInput:TextInput):Void {
				styleProvider.getStyleFunction(TextInput, null)(textInput);
			});
		}
		if (styleProvider.getStyleFunction(DatePicker, PopUpDatePicker.CHILD_VARIANT_DATE_PICKER) == null) {
			styleProvider.setStyleFunction(DatePicker, PopUpDatePicker.CHILD_VARIANT_DATE_PICKER, function(datePicker:DatePicker):Void {
				if (datePicker.backgroundSkin == null) {
					var backgroundSkin = new RectangleSkin();
					backgroundSkin.fill = SolidColor(theme.listDefaultColor);
					backgroundSkin.border = SolidColor(1.0, theme.backgroundColor);
					datePicker.backgroundSkin = backgroundSkin;
				}

				datePicker.setPadding(4.0);
				datePicker.headerGap = 2.0;
				datePicker.filters = [theme.getShadow(2.0)];
			});
		}
	}

	private static function drawIcon(icon:Shape, iconColor:Int):Void {
		// outline
		icon.graphics.lineStyle(1.0, iconColor);
		icon.graphics.drawRect(0.5, 1.5, 8.0, 7.0);
		icon.graphics.moveTo(2.0, 0.5);
		icon.graphics.lineTo(2.0, 1.5);
		icon.graphics.moveTo(7.0, 0.5);
		icon.graphics.lineTo(7.0, 1.5);

		// fills
		icon.graphics.lineStyle();
		icon.graphics.beginFill(iconColor);

		// header
		icon.graphics.drawRect(1.0, 2.0, 7.0, 1.0);

		// first row
		icon.graphics.drawRect(2.0, 4.0, 1.0, 1.0);
		icon.graphics.drawRect(4.0, 4.0, 1.0, 1.0);
		icon.graphics.drawRect(6.0, 4.0, 1.0, 1.0);

		// second row
		icon.graphics.drawRect(2.0, 6.0, 1.0, 1.0);
		icon.graphics.drawRect(4.0, 6.0, 1.0, 1.0);
		icon.graphics.drawRect(6.0, 6.0, 1.0, 1.0);

		icon.graphics.endFill();
	}
}
