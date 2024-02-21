/*
	feathersui-minimal-theme
	Copyright 2024 Bowler Hat LLC. All Rights Reserved.

	This program is free software. You can redistribute and/or modify it in
	accordance with the terms of the accompanying license agreement.
 */

package com.feathersui.themes.minimal.components;

import feathers.controls.LayoutGroup;
import feathers.layout.HorizontalLayout;
import feathers.skins.RectangleSkin;
import feathers.style.Theme;

/**
	Initialize "minimal" styles for the `LayoutGroup` component.
**/
@:dox(hide)
@:access(com.feathersui.themes.minimal.BaseMinimalTheme)
class MinimalLayoutGroupStyles {
	public static function initialize(?theme:BaseMinimalTheme):Void {
		if (theme == null) {
			theme = Std.downcast(Theme.fallbackTheme, BaseMinimalTheme);
		}
		if (theme == null) {
			return;
		}
		var styleProvider = theme.styleProvider;
		if (styleProvider.getStyleFunction(LayoutGroup, LayoutGroup.VARIANT_TOOL_BAR) == null) {
			styleProvider.setStyleFunction(LayoutGroup, LayoutGroup.VARIANT_TOOL_BAR, function(toolBar:LayoutGroup):Void {
				if (toolBar.backgroundSkin == null) {
					var backgroundSkin = new RectangleSkin();
					backgroundSkin.border = None;
					backgroundSkin.fill = SolidColor(theme.panelColor);
					backgroundSkin.width = 100.0;
					backgroundSkin.height = 16.0;
					toolBar.backgroundSkin = backgroundSkin;
				}

				if (toolBar.layout == null) {
					var layout = new HorizontalLayout();
					layout.paddingTop = 2.0;
					layout.paddingRight = 2.0;
					layout.paddingBottom = 2.0;
					layout.paddingLeft = 2.0;
					layout.gap = 2.0;
					layout.horizontalAlign = LEFT;
					layout.verticalAlign = MIDDLE;
					toolBar.layout = layout;
				}
			});
		}
	}
}
