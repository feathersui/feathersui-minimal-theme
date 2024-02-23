/*
	feathersui-minimal-theme
	Copyright 2024 Bowler Hat LLC. All Rights Reserved.

	This program is free software. You can redistribute and/or modify it in
	accordance with the terms of the accompanying license agreement.
 */

package com.feathersui.themes.minimal.components;

import feathers.utils.DeviceUtil;
import com.feathersui.themes.minimal.skins.MinimalToggleIconSkin;
import feathers.controls.PageIndicator;
import feathers.controls.ToggleButton;
import feathers.layout.HorizontalLayout;
import feathers.skins.MultiSkin;
import feathers.style.Theme;

/**
	Initialize "minimal" styles for the `PageIndicator` component.

	@since 1.0.0
**/
@:dox(hide)
@:access(com.feathersui.themes.minimal.BaseMinimalTheme)
class MinimalPageIndicatorStyles {
	public static function initialize(?theme:BaseMinimalTheme):Void {
		if (theme == null) {
			theme = Std.downcast(Theme.fallbackTheme, BaseMinimalTheme);
		}
		if (theme == null) {
			return;
		}
		var styleProvider = theme.styleProvider;
		if (styleProvider.getStyleFunction(PageIndicator, null) == null) {
			styleProvider.setStyleFunction(PageIndicator, null, function(pages:PageIndicator):Void {
				if (pages.focusRectSkin == null) {
					var focusRectSkin = theme.getFocusRectSkin();
					pages.focusRectSkin = focusRectSkin;
				}
				if (pages.layout == null) {
					var layout = new HorizontalLayout();
					layout.gap = 4.0;
					layout.paddingTop = 2.0;
					layout.paddingRight = 2.0;
					layout.paddingBottom = 2.0;
					layout.paddingLeft = 2.0;
					layout.horizontalAlign = CENTER;
					layout.verticalAlign = MIDDLE;
					pages.layout = layout;
				}
			});
		}
		if (styleProvider.getStyleFunction(ToggleButton, PageIndicator.CHILD_VARIANT_TOGGLE_BUTTON) == null) {
			styleProvider.setStyleFunction(ToggleButton, PageIndicator.CHILD_VARIANT_TOGGLE_BUTTON, function(button:ToggleButton):Void {
				var isDesktop = DeviceUtil.isDesktop();
				if (button.backgroundSkin == null) {
					var backgroundSkin = new MinimalToggleIconSkin(theme);
					backgroundSkin.padding = 1.0;
					if (isDesktop) {
						backgroundSkin.width = 8.0;
						backgroundSkin.height = 8.0;
					} else {
						backgroundSkin.width = 16.0;
						backgroundSkin.height = 16.0;
					}
					button.backgroundSkin = backgroundSkin;
				}
			});
		}
	}
}
