/*
	feathersui-minimal-theme
	Copyright 2024 Bowler Hat LLC. All Rights Reserved.

	This program is free software. You can redistribute and/or modify it in
	accordance with the terms of the accompanying license agreement.
 */

package com.feathersui.themes.minimal.components;

import feathers.utils.DeviceUtil;
import feathers.controls.TextInput;
import feathers.style.Theme;

/**
	Initialize "minimal" styles for the `TextInput` component.
**/
@:dox(hide)
@:access(com.feathersui.themes.minimal.BaseMinimalTheme)
class MinimalTextInputStyles {
	public static function initialize(?theme:BaseMinimalTheme):Void {
		if (theme == null) {
			theme = Std.downcast(Theme.fallbackTheme, BaseMinimalTheme);
		}
		if (theme == null) {
			return;
		}
		var styleProvider = theme.styleProvider;
		if (styleProvider.getStyleFunction(TextInput, null) == null) {
			styleProvider.setStyleFunction(TextInput, null, function(textInput:TextInput):Void {
				var isDesktop = DeviceUtil.isDesktop();
				if (textInput.backgroundSkin == null) {
					var backgroundSkin = theme.getBackSkin(null, theme.backgroundColor);
					if (isDesktop) {
						backgroundSkin.width = 100.0;
						backgroundSkin.height = 16.0;
					} else {
						backgroundSkin.width = 120.0;
						backgroundSkin.height = 32.0;
					}
					textInput.backgroundSkin = backgroundSkin;
				}
				if (textInput.focusRectSkin == null) {
					var focusRectSkin = theme.getFocusRectSkin();
					textInput.focusRectSkin = focusRectSkin;
				}
				textInput.setFocusPadding(2.0);
				if (textInput.textFormat == null) {
					textInput.textFormat = theme.getTextFormat(null, null, theme.inputTextColor);
				}
				if (textInput.disabledTextFormat == null) {
					textInput.disabledTextFormat = theme.getDisabledTextFormat(null, null, theme.inputTextDisabledColor);
				}
				if (textInput.promptTextFormat == null) {
					textInput.promptTextFormat = theme.getTextFormat(null, null, theme.promptTextColor);
				}
				textInput.embedFonts = theme.embedFonts;
				textInput.paddingLeft = 2.0;
				textInput.paddingRight = 2.0;
				textInput.verticalAlign = MIDDLE;
				textInput.leftViewGap = 2.0;
				textInput.rightViewGap = 2.0;
			});
		}
		if (styleProvider.getStyleFunction(TextInput, TextInput.VARIANT_SEARCH) == null) {
			styleProvider.setStyleFunction(TextInput, TextInput.VARIANT_SEARCH, function(textInput:TextInput):Void {
				styleProvider.getStyleFunction(TextInput, null)(textInput);
			});
		}
	}
}
