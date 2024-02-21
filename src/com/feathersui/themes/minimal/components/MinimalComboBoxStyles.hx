/*
	feathersui-minimal-theme
	Copyright 2024 Bowler Hat LLC. All Rights Reserved.

	This program is free software. You can redistribute and/or modify it in
	accordance with the terms of the accompanying license agreement.
 */

package com.feathersui.themes.minimal.components;

import com.feathersui.themes.minimal.skins.MinimalButtonSkin;
import feathers.controls.Button;
import feathers.controls.ComboBox;
import feathers.controls.Label;
import feathers.controls.ListView;
import feathers.controls.TextInput;
import feathers.style.Theme;

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
				if (button.backgroundSkin == null) {
					var backgroundSkin = new MinimalButtonSkin(theme);
					backgroundSkin.width = 20.0;
					backgroundSkin.height = 20.0;
					button.backgroundSkin = backgroundSkin;
				}
				if (button.textFormat == null) {
					button.textFormat = theme.getTextFormat();
				}
				if (button.disabledTextFormat == null) {
					button.disabledTextFormat = theme.getDisabledTextFormat();
				}
				button.embedFonts = theme.embedFonts;
				button.paddingTop = 1.0;
				button.paddingBottom = 1.0;
				button.paddingLeft = 2.0;
				button.paddingRight = 2.0;
				button.gap = 2.0;
				button.iconPosition = RIGHT;
				button.gap = Math.POSITIVE_INFINITY;
				if (button.icon == null) {
					button.icon = new Label("+");
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
