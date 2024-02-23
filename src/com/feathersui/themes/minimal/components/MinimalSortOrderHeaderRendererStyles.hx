/*
	feathersui-minimal-theme
	Copyright 2024 Bowler Hat LLC. All Rights Reserved.

	This program is free software. You can redistribute and/or modify it in
	accordance with the terms of the accompanying license agreement.
 */

package com.feathersui.themes.minimal.components;

import feathers.utils.DeviceUtil;
import com.feathersui.themes.minimal.skins.MinimalTriangleSkin;
import com.feathersui.themes.minimal.skins.MinimalRectangleSkin;
import feathers.controls.dataRenderers.SortOrderHeaderRenderer;
import feathers.style.Theme;

/**
	Initialize "minimal" styles for the `SortOrderHeaderRenderer` component.
**/
@:dox(hide)
@:access(com.feathersui.themes.minimal.BaseMinimalTheme)
class MinimalSortOrderHeaderRendererStyles {
	public static function initialize(?theme:BaseMinimalTheme):Void {
		if (theme == null) {
			theme = Std.downcast(Theme.fallbackTheme, BaseMinimalTheme);
		}
		if (theme == null) {
			return;
		}
		var styleProvider = theme.styleProvider;
		if (styleProvider.getStyleFunction(SortOrderHeaderRenderer, null) == null) {
			styleProvider.setStyleFunction(SortOrderHeaderRenderer, null, function(headerRenderer:SortOrderHeaderRenderer):Void {
				var isDesktop = DeviceUtil.isDesktop();
				if (headerRenderer.backgroundSkin == null) {
					var backgroundSkin = new MinimalRectangleSkin();
					backgroundSkin.border = None;
					backgroundSkin.fill = SolidColor(theme.listHeadingColor);
					if (isDesktop) {
						backgroundSkin.width = 100.0;
						backgroundSkin.height = 20.0;
					} else {
						backgroundSkin.width = 120.0;
						backgroundSkin.height = 40.0;
					}
					headerRenderer.backgroundSkin = backgroundSkin;
				}
				if (headerRenderer.sortAscendingIcon == null) {
					var sortAscendingIcon = new MinimalTriangleSkin();
					sortAscendingIcon.pointPosition = TOP;
					sortAscendingIcon.fill = SolidColor(theme.labelTextColor);
					sortAscendingIcon.disabledFill = SolidColor(theme.labelTextDisabledColor);
					sortAscendingIcon.width = 6.0;
					sortAscendingIcon.height = 3.0;
					headerRenderer.sortAscendingIcon = sortAscendingIcon;
				}
				if (headerRenderer.sortDescendingIcon == null) {
					var sortDescendingIcon = new MinimalTriangleSkin();
					sortDescendingIcon.pointPosition = BOTTOM;
					sortDescendingIcon.fill = SolidColor(theme.labelTextColor);
					sortDescendingIcon.disabledFill = SolidColor(theme.labelTextDisabledColor);
					sortDescendingIcon.width = 6.0;
					sortDescendingIcon.height = 3.0;
					headerRenderer.sortDescendingIcon = sortDescendingIcon;
				}
				if (headerRenderer.textFormat == null) {
					headerRenderer.textFormat = theme.getTextFormat();
				}
				if (headerRenderer.disabledTextFormat == null) {
					headerRenderer.disabledTextFormat = theme.getDisabledTextFormat();
				}
				headerRenderer.embedFonts = theme.embedFonts;
				headerRenderer.horizontalAlign = LEFT;
				headerRenderer.paddingLeft = 5.0;
				headerRenderer.paddingRight = 5.0;
				headerRenderer.gap = 2.0;
			});
		}
	}
}
