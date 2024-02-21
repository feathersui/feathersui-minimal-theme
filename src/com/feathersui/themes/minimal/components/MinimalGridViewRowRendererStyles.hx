/*
	feathersui-minimal-theme
	Copyright 2024 Bowler Hat LLC. All Rights Reserved.

	This program is free software. You can redistribute and/or modify it in
	accordance with the terms of the accompanying license agreement.
 */

package com.feathersui.themes.minimal.components;

import feathers.controls.ToggleButtonState;
import feathers.controls.dataRenderers.GridViewRowRenderer;
import feathers.skins.RectangleSkin;
import feathers.style.Theme;

/**
	Initialize "minimal" styles for the `GridViewRowRenderer` component.
**/
@:dox(hide)
@:access(com.feathersui.themes.minimal.BaseMinimalTheme)
class MinimalGridViewRowRendererStyles {
	public static function initialize(?theme:BaseMinimalTheme):Void {
		if (theme == null) {
			theme = Std.downcast(Theme.fallbackTheme, BaseMinimalTheme);
		}
		if (theme == null) {
			return;
		}
		var styleProvider = theme.styleProvider;
		if (styleProvider.getStyleFunction(GridViewRowRenderer, null) == null) {
			styleProvider.setStyleFunction(GridViewRowRenderer, null, function(rowRenderer:GridViewRowRenderer):Void {
				if (rowRenderer.backgroundSkin == null) {
					var backgroundSkin = new RectangleSkin();
					backgroundSkin.border = None;
					backgroundSkin.fill = SolidColor(theme.listDefaultColor);
					backgroundSkin.selectedFill = SolidColor(theme.listSelectedColor);
					backgroundSkin.setFillForState(ToggleButtonState.HOVER(false), SolidColor(theme.listRollOverColor));
					backgroundSkin.setFillForState(ToggleButtonState.DOWN(false), SolidColor(theme.listSelectedColor));
					backgroundSkin.width = 100.0;
					backgroundSkin.height = 20.0;
					rowRenderer.backgroundSkin = backgroundSkin;
				}
			});
		}
	}
}
