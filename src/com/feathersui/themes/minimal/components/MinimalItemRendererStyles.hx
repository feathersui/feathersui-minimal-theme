/*
	feathersui-minimal-theme
	Copyright 2024 Bowler Hat LLC. All Rights Reserved.

	This program is free software. You can redistribute and/or modify it in
	accordance with the terms of the accompanying license agreement.
 */

package com.feathersui.themes.minimal.components;

import feathers.utils.DeviceUtil;
import com.feathersui.themes.minimal.skins.MinimalRectangleSkin;
import feathers.controls.ToggleButtonState;
import feathers.controls.dataRenderers.ItemRenderer;
import feathers.style.Theme;

/**
	Initialize "minimal" styles for the `ItemRenderer` component.
**/
@:dox(hide)
@:access(com.feathersui.themes.minimal.BaseMinimalTheme)
class MinimalItemRendererStyles {
	public static function initialize(?theme:BaseMinimalTheme):Void {
		if (theme == null) {
			theme = Std.downcast(Theme.fallbackTheme, BaseMinimalTheme);
		}
		if (theme == null) {
			return;
		}
		var styleProvider = theme.styleProvider;
		if (styleProvider.getStyleFunction(ItemRenderer, null) == null) {
			styleProvider.setStyleFunction(ItemRenderer, null, function(itemRenderer:ItemRenderer):Void {
				var isDesktop = DeviceUtil.isDesktop();
				if (itemRenderer.backgroundSkin == null) {
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
					itemRenderer.backgroundSkin = backgroundSkin;
				}
				if (itemRenderer.textFormat == null) {
					itemRenderer.textFormat = theme.getTextFormat();
				}
				if (itemRenderer.disabledTextFormat == null) {
					itemRenderer.disabledTextFormat = theme.getDisabledTextFormat();
				}
				if (itemRenderer.secondaryTextFormat == null) {
					itemRenderer.secondaryTextFormat = theme.getTextFormat(null, theme.detailFontSize, theme.secondaryLabelTextColor);
				}
				if (itemRenderer.disabledSecondaryTextFormat == null) {
					itemRenderer.disabledSecondaryTextFormat = theme.getDisabledTextFormat(null, theme.detailFontSize);
				}
				itemRenderer.embedFonts = theme.embedFonts;
				itemRenderer.horizontalAlign = LEFT;
				itemRenderer.paddingLeft = theme.smallPadding + theme.largePadding;
				itemRenderer.paddingRight = theme.smallPadding + theme.largePadding;
				itemRenderer.gap = theme.mediumPadding;
			});
		}
	}
}
