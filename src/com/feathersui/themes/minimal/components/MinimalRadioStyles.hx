/*
	feathersui-minimal-theme
	Copyright 2024 Bowler Hat LLC. All Rights Reserved.

	This program is free software. You can redistribute and/or modify it in
	accordance with the terms of the accompanying license agreement.
 */

package com.feathersui.themes.minimal.components;

import feathers.utils.DeviceUtil;
import com.feathersui.themes.minimal.skins.MinimalCircleSkin;
import com.feathersui.themes.minimal.skins.MinimalToggleIconSkin;
import feathers.controls.Radio;
import feathers.style.Theme;

/**
	Initialize "minimal" styles for the `Radio` component.
**/
@:dox(hide)
@:access(com.feathersui.themes.minimal.BaseMinimalTheme)
class MinimalRadioStyles {
	public static function initialize(?theme:BaseMinimalTheme):Void {
		if (theme == null) {
			theme = Std.downcast(Theme.fallbackTheme, BaseMinimalTheme);
		}
		if (theme == null) {
			return;
		}
		var styleProvider = theme.styleProvider;
		if (styleProvider.getStyleFunction(Radio, null) == null) {
			styleProvider.setStyleFunction(Radio, null, function(radio:Radio):Void {
				var isDesktop = DeviceUtil.isDesktop();
				if (radio.icon == null) {
					var icon = new MinimalToggleIconSkin(theme, MinimalCircleSkin);
					if (isDesktop) {
						icon.width = 10.0;
						icon.height = 10.0;
					} else {
						icon.width = 20.0;
						icon.height = 20.0;
					}
					radio.icon = icon;
				}
				if (radio.focusRectSkin == null) {
					var focusRectSkin = theme.getFocusRectSkin();
					radio.focusRectSkin = focusRectSkin;
				}
				radio.setFocusPadding(theme.mediumPadding);
				if (radio.textFormat == null) {
					radio.textFormat = theme.getTextFormat();
				}
				if (radio.disabledTextFormat == null) {
					radio.disabledTextFormat = theme.getDisabledTextFormat();
				}
				radio.embedFonts = theme.embedFonts;
				radio.gap = theme.mediumPadding;
			});
		}
	}
}
