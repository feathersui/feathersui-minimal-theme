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
import feathers.style.Theme;

/**
	Initialize "minimal" styles for the `Button` component.
**/
@:access(com.feathersui.themes.minimal.BaseMinimalTheme)
class MinimalButtonStyles {
	public static function initialize(?theme:BaseMinimalTheme):Void {
		if (theme == null) {
			theme = Std.downcast(Theme.fallbackTheme, BaseMinimalTheme);
		}
		if (theme == null) {
			return;
		}
		var styleProvider = theme.styleProvider;
		if (styleProvider.getStyleFunction(Button, null) == null) {
			styleProvider.setStyleFunction(Button, null, function(button:Button):Void {
				var isDesktop = DeviceUtil.isDesktop();
				if (button.backgroundSkin == null) {
					var backgroundSkin = new MinimalButtonSkin(theme);
					if (isDesktop) {
						backgroundSkin.width = 100.0;
						backgroundSkin.height = 20.0;
					} else {
						backgroundSkin.width = 120.0;
						backgroundSkin.height = 40.0;
					}
					button.backgroundSkin = backgroundSkin;
				}
				if (button.focusRectSkin == null) {
					var focusRectSkin = theme.getFocusRectSkin();
					button.focusRectSkin = focusRectSkin;
				}
				button.setFocusPadding(theme.mediumPadding);
				if (button.textFormat == null) {
					button.textFormat = theme.getTextFormat();
				}
				if (button.disabledTextFormat == null) {
					button.disabledTextFormat = theme.getDisabledTextFormat();
				}
				button.embedFonts = theme.embedFonts;
				button.paddingLeft = theme.mediumPadding;
				button.paddingRight = theme.mediumPadding;
				button.gap = theme.mediumPadding;
			});
		}
		if (styleProvider.getStyleFunction(Button, Button.VARIANT_PRIMARY) == null) {
			styleProvider.setStyleFunction(Button, Button.VARIANT_PRIMARY, function(button:Button):Void {
				styleProvider.getStyleFunction(Button, null)(button);
			});
		}
		if (styleProvider.getStyleFunction(Button, Button.VARIANT_DANGER) == null) {
			styleProvider.setStyleFunction(Button, Button.VARIANT_DANGER, function(button:Button):Void {
				styleProvider.getStyleFunction(Button, null)(button);
			});
		}
	}
}
