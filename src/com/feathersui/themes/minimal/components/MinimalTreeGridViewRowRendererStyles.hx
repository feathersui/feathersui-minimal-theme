/*
	feathersui-minimal-theme
	Copyright 2024 Bowler Hat LLC. All Rights Reserved.

	This program is free software. You can redistribute and/or modify it in
	accordance with the terms of the accompanying license agreement.
 */

package com.feathersui.themes.minimal.components;

import feathers.utils.DeviceUtil;
#if (feathersui >= "1.3.0")
import com.feathersui.themes.minimal.skins.MinimalRectangleSkin;
import feathers.controls.ToggleButtonState;
import feathers.controls.dataRenderers.TreeGridViewRowRenderer;
import feathers.style.Theme;

/**
	Initialize "minimal" styles for the `TreeGridViewRowRenderer` component.
**/
@:dox(hide)
@:access(com.feathersui.themes.minimal.BaseMinimalTheme)
class MinimalTreeGridViewRowRendererStyles {
	public static function initialize(?theme:BaseMinimalTheme):Void {
		if (theme == null) {
			theme = Std.downcast(Theme.fallbackTheme, BaseMinimalTheme);
		}
		if (theme == null) {
			return;
		}
		var styleProvider = theme.styleProvider;
		if (styleProvider.getStyleFunction(TreeGridViewRowRenderer, null) == null) {
			styleProvider.setStyleFunction(TreeGridViewRowRenderer, null, function(rowRenderer:TreeGridViewRowRenderer):Void {
				var isDesktop = DeviceUtil.isDesktop();
				if (rowRenderer.backgroundSkin == null) {
					var backgroundSkin = new MinimalRectangleSkin();
					backgroundSkin.border = None;
					backgroundSkin.fill = SolidColor(theme.listDefaultColor);
					backgroundSkin.selectedFill = SolidColor(theme.listSelectedColor);
					backgroundSkin.setFillForState(ToggleButtonState.HOVER(false), SolidColor(theme.listRollOverColor));
					backgroundSkin.setFillForState(ToggleButtonState.DOWN(false), SolidColor(theme.listSelectedColor));
					if (isDesktop) {
						backgroundSkin.width = 100.0;
						backgroundSkin.height = 20.0;
					} else {
						backgroundSkin.width = 120.0;
						backgroundSkin.height = 40.0;
					}
					rowRenderer.backgroundSkin = backgroundSkin;
				}
			});
		}
	}
}
#end
