/*
	feathersui-minimal-theme
	Copyright 2024 Bowler Hat LLC. All Rights Reserved.

	This program is free software. You can redistribute and/or modify it in
	accordance with the terms of the accompanying license agreement.
 */

package com.feathersui.themes.minimal.components;

import com.feathersui.themes.minimal.skins.MinimalRectangleSkin;
import feathers.controls.ToggleButton;
import feathers.controls.ToggleButtonState;
import feathers.controls.dataRenderers.HierarchicalItemRenderer;
import feathers.skins.MultiSkin;
import feathers.style.Theme;
import openfl.display.Shape;

/**
	Initialize "minimal" styles for the `HierarchicalItemRenderer` component.
**/
@:dox(hide)
@:access(com.feathersui.themes.minimal.BaseMinimalTheme)
class MinimalHierarchicalItemRendererStyles {
	public static function initialize(?theme:BaseMinimalTheme):Void {
		if (theme == null) {
			theme = Std.downcast(Theme.fallbackTheme, BaseMinimalTheme);
		}
		if (theme == null) {
			return;
		}
		var styleProvider = theme.styleProvider;
		if (styleProvider.getStyleFunction(HierarchicalItemRenderer, null) == null) {
			styleProvider.setStyleFunction(HierarchicalItemRenderer, null, function(itemRenderer:HierarchicalItemRenderer):Void {
				if (itemRenderer.backgroundSkin == null) {
					var backgroundSkin = new MinimalRectangleSkin();
					backgroundSkin.border = None;
					backgroundSkin.fill = SolidColor(theme.listDefaultColor);
					backgroundSkin.selectedFill = SolidColor(theme.listSelectedColor);
					backgroundSkin.setFillForState(ToggleButtonState.HOVER(false), SolidColor(theme.listRollOverColor));
					backgroundSkin.setFillForState(ToggleButtonState.DOWN(false), SolidColor(theme.listSelectedColor));
					backgroundSkin.width = 100.0;
					backgroundSkin.height = 20.0;
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
				itemRenderer.paddingTop = 1.0;
				itemRenderer.paddingBottom = 1.0;
				itemRenderer.paddingLeft = 5.0;
				itemRenderer.paddingRight = 5.0;
				itemRenderer.gap = 2.0;
				itemRenderer.indentation = 6.0;
			});
		}
		if (styleProvider.getStyleFunction(ToggleButton, HierarchicalItemRenderer.CHILD_VARIANT_DISCLOSURE_BUTTON) == null) {
			styleProvider.setStyleFunction(ToggleButton, HierarchicalItemRenderer.CHILD_VARIANT_DISCLOSURE_BUTTON, function(button:ToggleButton):Void {
				if (button.icon == null) {
					var icon = new MultiSkin();
					button.icon = icon;

					var defaultIcon = new Shape();
					defaultIcon.graphics.beginFill(0xff00ff, 0.0);
					defaultIcon.graphics.drawRect(0.0, 0.0, 10.0, 10.0);
					defaultIcon.graphics.endFill();
					defaultIcon.graphics.beginFill(theme.labelTextColor);
					defaultIcon.graphics.moveTo(2.0, 2.0);
					defaultIcon.graphics.lineTo(8.0, 5.0);
					defaultIcon.graphics.lineTo(2.0, 8.0);
					defaultIcon.graphics.lineTo(2.0, 2.0);
					defaultIcon.graphics.endFill();
					icon.defaultView = defaultIcon;

					var disabledIcon = new Shape();
					disabledIcon.graphics.beginFill(0xff00ff, 0.0);
					disabledIcon.graphics.drawRect(0.0, 0.0, 10.0, 10.0);
					disabledIcon.graphics.endFill();
					disabledIcon.graphics.beginFill(theme.labelTextDisabledColor);
					disabledIcon.graphics.moveTo(2.0, 2.0);
					disabledIcon.graphics.lineTo(8.0, 5.0);
					disabledIcon.graphics.lineTo(2.0, 8.0);
					disabledIcon.graphics.lineTo(2.0, 2.0);
					disabledIcon.graphics.endFill();
					icon.disabledView = disabledIcon;

					var selectedIcon = new Shape();
					selectedIcon.graphics.beginFill(0xff00ff, 0.0);
					selectedIcon.graphics.drawRect(0.0, 0.0, 10.0, 10.0);
					selectedIcon.graphics.endFill();
					selectedIcon.graphics.beginFill(theme.labelTextColor);
					selectedIcon.graphics.moveTo(2.0, 2.0);
					selectedIcon.graphics.lineTo(8.0, 2.0);
					selectedIcon.graphics.lineTo(5.0, 8.0);
					selectedIcon.graphics.lineTo(2.0, 2.0);
					selectedIcon.graphics.endFill();
					icon.selectedView = selectedIcon;

					var selectedDisabledIcon = new Shape();
					selectedDisabledIcon.graphics.beginFill(0xff00ff, 0.0);
					selectedDisabledIcon.graphics.drawRect(0.0, 0.0, 10.0, 10.0);
					selectedDisabledIcon.graphics.endFill();
					selectedDisabledIcon.graphics.beginFill(theme.labelTextDisabledColor);
					selectedDisabledIcon.graphics.moveTo(2.0, 2.0);
					selectedDisabledIcon.graphics.lineTo(8.0, 2.0);
					selectedDisabledIcon.graphics.lineTo(5.0, 8.0);
					selectedDisabledIcon.graphics.lineTo(2.0, 2.0);
					selectedDisabledIcon.graphics.endFill();
					icon.setViewForState(DISABLED(true), selectedDisabledIcon);
				}
			});
		}
	}
}
