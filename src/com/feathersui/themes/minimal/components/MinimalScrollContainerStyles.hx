/*
	feathersui-minimal-theme
	Copyright 2024 Bowler Hat LLC. All Rights Reserved.

	This program is free software. You can redistribute and/or modify it in
	accordance with the terms of the accompanying license agreement.
 */

package com.feathersui.themes.minimal.components;

import feathers.controls.ScrollContainer;
import feathers.style.Theme;
import feathers.utils.DeviceUtil;

/**
	Initialize "minimal" styles for the `ScrollContainer` component.

	@since 1.0.0
**/
@:dox(hide)
@:access(com.feathersui.themes.minimal.BaseMinimalTheme)
class MinimalScrollContainerStyles {
	public static function initialize(?theme:BaseMinimalTheme):Void {
		if (theme == null) {
			theme = Std.downcast(Theme.fallbackTheme, BaseMinimalTheme);
		}
		if (theme == null) {
			return;
		}
		var styleProvider = theme.styleProvider;
		if (styleProvider.getStyleFunction(ScrollContainer, null) == null) {
			styleProvider.setStyleFunction(ScrollContainer, null, function(container:ScrollContainer):Void {
				var isDesktop = DeviceUtil.isDesktop();

				container.autoHideScrollBars = !isDesktop;
				container.fixedScrollBars = isDesktop;

				if (container.backgroundSkin == null) {
					var backgroundSkin = theme.getBackSkin(theme.panelColor);
					container.backgroundSkin = backgroundSkin;
				}

				if (container.focusRectSkin == null) {
					var focusRectSkin = theme.getFocusRectSkin();
					container.focusRectSkin = focusRectSkin;
				}
			});
		}
	}
}
