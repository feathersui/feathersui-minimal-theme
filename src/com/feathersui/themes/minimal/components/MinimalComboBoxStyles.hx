/*
	feathersui-minimal-theme
	Copyright 2024 Bowler Hat LLC. All Rights Reserved.

	This program is free software. You can redistribute and/or modify it in
	accordance with the terms of the accompanying license agreement.
 */

package com.feathersui.themes.minimal.components;

import feathers.utils.DeviceUtil;
import com.feathersui.themes.minimal.skins.MinimalButtonSkin;
import feathers.controls.Button;
import feathers.controls.ComboBox;
import feathers.controls.ListView;
import feathers.controls.TextInput;
import feathers.skins.MultiSkin;
import feathers.style.Theme;
import openfl.display.Shape;

/**
	Initialize "minimal" styles for the `ComboBox` component.
**/
@:access(com.feathersui.themes.minimal.BaseMinimalTheme)
class MinimalComboBoxStyles {
	public static function initialize(?theme:BaseMinimalTheme):Void {
		if (theme == null) {
			theme = Std.downcast(Theme.fallbackTheme, BaseMinimalTheme);
		}
		if (theme == null) {
			return;
		}
		var styleProvider = theme.styleProvider;
		if (styleProvider.getStyleFunction(Button, ComboBox.CHILD_VARIANT_BUTTON) == null) {
			styleProvider.setStyleFunction(Button, ComboBox.CHILD_VARIANT_BUTTON, function(button:Button):Void {
				var isDesktop = DeviceUtil.isDesktop();
				if (button.backgroundSkin == null) {
					var backgroundSkin = new MinimalButtonSkin(theme);
					if (isDesktop) {
						backgroundSkin.width = 16.0;
						backgroundSkin.height = 16.0;
					} else {
						backgroundSkin.width = 32.0;
						backgroundSkin.height = 32.0;
					}
					button.backgroundSkin = backgroundSkin;
				}
				if (button.textFormat == null) {
					button.textFormat = theme.getTextFormat();
				}
				if (button.disabledTextFormat == null) {
					button.disabledTextFormat = theme.getDisabledTextFormat();
				}
				button.embedFonts = theme.embedFonts;
				button.paddingLeft = 2.0;
				button.paddingRight = 2.0;
				button.gap = 2.0;
				button.iconPosition = RIGHT;
				button.gap = Math.POSITIVE_INFINITY;
				if (button.icon == null) {
					var icon = new MultiSkin();

					var defaultIcon = new Shape();
					defaultIcon.graphics.beginFill(theme.labelTextColor);
					defaultIcon.graphics.drawRect(2.0, 0.0, 1.0, 5.0);
					defaultIcon.graphics.drawRect(0.0, 2.0, 5.0, 1.0);
					defaultIcon.graphics.endFill();
					icon.defaultView = defaultIcon;

					var disabledIcon = new Shape();
					disabledIcon.graphics.beginFill(theme.labelTextDisabledColor);
					disabledIcon.graphics.drawRect(2.0, 0.0, 1.0, 5.0);
					disabledIcon.graphics.drawRect(0.0, 2.0, 5.0, 1.0);
					disabledIcon.graphics.endFill();
					icon.disabledView = disabledIcon;

					button.icon = icon;
				}
			});
		}
		if (styleProvider.getStyleFunction(TextInput, ComboBox.CHILD_VARIANT_TEXT_INPUT) == null) {
			styleProvider.setStyleFunction(TextInput, ComboBox.CHILD_VARIANT_TEXT_INPUT, function(textInput:TextInput):Void {
				styleProvider.getStyleFunction(TextInput, null)(textInput);
			});
		}
		if (styleProvider.getStyleFunction(ListView, ComboBox.CHILD_VARIANT_LIST_VIEW) == null) {
			styleProvider.setStyleFunction(ListView, ComboBox.CHILD_VARIANT_LIST_VIEW, function(listView:ListView):Void {
				styleProvider.getStyleFunction(ListView, ListView.VARIANT_POP_UP)(listView);
			});
		}
	}
}
