/*
	feathersui-minimal-theme
	Copyright 2024 Bowler Hat LLC. All Rights Reserved.

	This program is free software. You can redistribute and/or modify it in
	accordance with the terms of the accompanying license agreement.
 */

package com.feathersui.themes.minimal.components;

import feathers.utils.DeviceUtil;
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
				itemRenderer.indentation = theme.mediumPadding + theme.largePadding;
			});
		}
		if (styleProvider.getStyleFunction(ToggleButton, HierarchicalItemRenderer.CHILD_VARIANT_DISCLOSURE_BUTTON) == null) {
			styleProvider.setStyleFunction(ToggleButton, HierarchicalItemRenderer.CHILD_VARIANT_DISCLOSURE_BUTTON, function(button:ToggleButton):Void {
				if (button.icon == null) {
					var icon = new MultiSkin();
					button.icon = icon;

					var defaultIcon = new Shape();
					drawDisclosureIconClosed(defaultIcon, theme.labelTextColor);
					icon.defaultView = defaultIcon;

					var disabledIcon = new Shape();
					drawDisclosureIconClosed(disabledIcon, theme.labelTextDisabledColor);
					icon.disabledView = disabledIcon;

					var selectedIcon = new Shape();
					drawDisclosureIconOpen(selectedIcon, theme.labelTextColor);
					icon.selectedView = selectedIcon;

					var selectedDisabledIcon = new Shape();
					drawDisclosureIconOpen(selectedDisabledIcon, theme.labelTextDisabledColor);
					icon.setViewForState(DISABLED(true), selectedDisabledIcon);
				}
			});
		}
	}

	private static function drawDisclosureIconClosed(icon:Shape, color:UInt):Void {
		icon.graphics.beginFill(0xff00ff, 0.0);
		icon.graphics.drawRect(0.0, 0.0, 10.0, 10.0);
		icon.graphics.endFill();
		icon.graphics.beginFill(color);
		icon.graphics.moveTo(2.0, 2.0);
		icon.graphics.lineTo(8.0, 5.0);
		icon.graphics.lineTo(2.0, 8.0);
		icon.graphics.lineTo(2.0, 2.0);
		icon.graphics.endFill();
	}

	private static function drawDisclosureIconOpen(icon:Shape, color:UInt):Void {
		icon.graphics.beginFill(0xff00ff, 0.0);
		icon.graphics.drawRect(0.0, 0.0, 10.0, 10.0);
		icon.graphics.endFill();
		icon.graphics.beginFill(color);
		icon.graphics.moveTo(2.0, 2.0);
		icon.graphics.lineTo(8.0, 2.0);
		icon.graphics.lineTo(5.0, 8.0);
		icon.graphics.lineTo(2.0, 2.0);
		icon.graphics.endFill();
	}
}
