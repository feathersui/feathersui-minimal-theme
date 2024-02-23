/*
	feathersui-minimal-theme
	Copyright 2024 Bowler Hat LLC. All Rights Reserved.

	This program is free software. You can redistribute and/or modify it in
	accordance with the terms of the accompanying license agreement.
 */

package com.feathersui.themes.minimal.components;

import feathers.utils.DeviceUtil;
import com.feathersui.themes.minimal.skins.MinimalToggleIconSkin;
import feathers.controls.Check;
import feathers.style.Theme;

/**
	Initialize "minimal" styles for the `Check` component.
**/
@:access(com.feathersui.themes.minimal.BaseMinimalTheme)
class MinimalCheckStyles {
	public static function initialize(?theme:BaseMinimalTheme):Void {
		if (theme == null) {
			theme = Std.downcast(Theme.fallbackTheme, BaseMinimalTheme);
		}
		if (theme == null) {
			return;
		}
		var styleProvider = theme.styleProvider;
		if (styleProvider.getStyleFunction(Check, null) == null) {
			styleProvider.setStyleFunction(Check, null, function(check:Check):Void {
				var isDesktop = DeviceUtil.isDesktop();
				if (check.icon == null) {
					var icon = new MinimalToggleIconSkin(theme);
					if (isDesktop) {
						icon.width = 10.0;
						icon.height = 10.0;
					} else {
						icon.width = 20.0;
						icon.height = 20.0;
					}
					check.icon = icon;
				}
				if (check.focusRectSkin == null) {
					var focusRectSkin = theme.getFocusRectSkin();
					check.focusRectSkin = focusRectSkin;
				}
				check.setFocusPadding(2.0);
				if (check.textFormat == null) {
					check.textFormat = theme.getTextFormat();
				}
				if (check.disabledTextFormat == null) {
					check.disabledTextFormat = theme.getDisabledTextFormat();
				}
				check.embedFonts = theme.embedFonts;
				check.gap = 2.0;
			});
		}
	}
}
