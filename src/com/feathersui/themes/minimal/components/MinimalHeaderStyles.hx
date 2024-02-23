/*
	feathersui-minimal-theme
	Copyright 2024 Bowler Hat LLC. All Rights Reserved.

	This program is free software. You can redistribute and/or modify it in
	accordance with the terms of the accompanying license agreement.
 */

package com.feathersui.themes.minimal.components;

import feathers.utils.DeviceUtil;
import com.feathersui.themes.minimal.skins.MinimalRectangleSkin;
import feathers.controls.Header;
import feathers.style.Theme;

/**
	Initialize "minimal" styles for the `Header` component.
**/
@:dox(hide)
@:access(com.feathersui.themes.minimal.BaseMinimalTheme)
class MinimalHeaderStyles {
	public static function initialize(?theme:BaseMinimalTheme):Void {
		if (theme == null) {
			theme = Std.downcast(Theme.fallbackTheme, BaseMinimalTheme);
		}
		if (theme == null) {
			return;
		}
		var styleProvider = theme.styleProvider;
		if (styleProvider.getStyleFunction(Header, null) == null) {
			styleProvider.setStyleFunction(Header, null, function(header:Header):Void {
				var isDesktop = DeviceUtil.isDesktop();
				if (header.backgroundSkin == null) {
					var backgroundSkin = new MinimalRectangleSkin();
					backgroundSkin.border = None;
					backgroundSkin.fill = SolidColor(theme.panelColor);
					if (isDesktop) {
						backgroundSkin.width = 100.0;
						backgroundSkin.height = 16.0;
					} else {
						backgroundSkin.width = 120.0;
						backgroundSkin.height = 32.0;
					}
					header.backgroundSkin = backgroundSkin;
				}
				if (header.textFormat == null) {
					header.textFormat = theme.getTextFormat();
				}
				if (header.disabledTextFormat == null) {
					header.disabledTextFormat = theme.getDisabledTextFormat();
				}
				header.embedFonts = theme.embedFonts;

				#if (feathersui >= "1.3.0")
				header.setPadding(theme.mediumPadding);
				#else
				header.paddingTop = theme.mediumPadding;
				header.paddingRight = theme.mediumPadding;
				header.paddingBottom = theme.mediumPadding;
				header.paddingLeft = theme.mediumPadding;
				#end
				header.minGap = theme.mediumPadding;
			});
		}
	}
}
