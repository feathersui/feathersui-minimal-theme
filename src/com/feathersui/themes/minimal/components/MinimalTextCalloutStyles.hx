/*
	feathersui-minimal-theme
	Copyright 2024 Bowler Hat LLC. All Rights Reserved.

	This program is free software. You can redistribute and/or modify it in
	accordance with the terms of the accompanying license agreement.
 */

package com.feathersui.themes.minimal.components;

import com.feathersui.themes.minimal.skins.MinimalTriangleSkin;
import com.feathersui.themes.minimal.skins.MinimalRectangleSkin;
import feathers.controls.TextCallout;
import feathers.style.Theme;

/**
	Initialize "minimal" styles for the `TextCallout` component.
**/
@:dox(hide)
@:access(com.feathersui.themes.minimal.BaseMinimalTheme)
class MinimalTextCalloutStyles {
	public static function initialize(?theme:BaseMinimalTheme):Void {
		if (theme == null) {
			theme = Std.downcast(Theme.fallbackTheme, BaseMinimalTheme);
		}
		if (theme == null) {
			return;
		}
		var styleProvider = theme.styleProvider;
		if (styleProvider.getStyleFunction(TextCallout, null) == null) {
			styleProvider.setStyleFunction(TextCallout, null, function(textCallout:TextCallout):Void {
				if (textCallout.backgroundSkin == null) {
					var backgroundSkin = new MinimalRectangleSkin();
					backgroundSkin.fill = SolidColor(theme.textBackgroundColor);
					backgroundSkin.border = None;
					backgroundSkin.width = 8.0;
					backgroundSkin.height = 8.0;
					backgroundSkin.filters = [theme.getShadow(2.0)];
					textCallout.backgroundSkin = backgroundSkin;
				}
				if (textCallout.topArrowSkin == null) {
					var topArrowSkin = new MinimalTriangleSkin();
					topArrowSkin.pointPosition = TOP;
					topArrowSkin.drawBaseBorder = false;
					topArrowSkin.fill = SolidColor(theme.textBackgroundColor);
					topArrowSkin.border = None;
					topArrowSkin.width = 8.0;
					topArrowSkin.height = 6.0;
					textCallout.topArrowSkin = topArrowSkin;
				}
				if (textCallout.rightArrowSkin == null) {
					var rightArrowSkin = new MinimalTriangleSkin();
					rightArrowSkin.pointPosition = RIGHT;
					rightArrowSkin.drawBaseBorder = false;
					rightArrowSkin.fill = SolidColor(theme.textBackgroundColor);
					rightArrowSkin.border = None;
					rightArrowSkin.width = 6.0;
					rightArrowSkin.height = 8.0;
					rightArrowSkin.filters = [theme.getShadow(2.0)];
					textCallout.rightArrowSkin = rightArrowSkin;
				}
				if (textCallout.bottomArrowSkin == null) {
					var bottomArrowSkin = new MinimalTriangleSkin();
					bottomArrowSkin.pointPosition = BOTTOM;
					bottomArrowSkin.drawBaseBorder = false;
					bottomArrowSkin.fill = SolidColor(theme.textBackgroundColor);
					bottomArrowSkin.border = None;
					bottomArrowSkin.width = 8.0;
					bottomArrowSkin.height = 6.0;
					bottomArrowSkin.filters = [theme.getShadow(2.0)];
					textCallout.bottomArrowSkin = bottomArrowSkin;
				}
				if (textCallout.leftArrowSkin == null) {
					var leftArrowSkin = new MinimalTriangleSkin();
					leftArrowSkin.pointPosition = LEFT;
					leftArrowSkin.drawBaseBorder = false;
					leftArrowSkin.fill = SolidColor(theme.textBackgroundColor);
					leftArrowSkin.border = None;
					leftArrowSkin.width = 6.0;
					leftArrowSkin.height = 8.0;
					textCallout.leftArrowSkin = leftArrowSkin;
				}
				if (textCallout.textFormat == null) {
					textCallout.textFormat = theme.getTextFormat();
				}
				if (textCallout.disabledTextFormat == null) {
					textCallout.disabledTextFormat = theme.getDisabledTextFormat();
				}
				textCallout.embedFonts = theme.embedFonts;

				textCallout.marginTop = 2.0 * theme.largePadding;
				textCallout.marginRight = 2.0 * theme.largePadding;
				textCallout.marginBottom = 2.0 * theme.largePadding;
				textCallout.marginLeft = 2.0 * theme.largePadding;
			});
		}
	}
}
