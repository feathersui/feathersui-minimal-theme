/*
	feathersui-minimal-theme
	Copyright 2024 Bowler Hat LLC. All Rights Reserved.

	This program is free software. You can redistribute and/or modify it in
	accordance with the terms of the accompanying license agreement.
 */

package com.feathersui.themes.minimal.components;

import com.feathersui.themes.minimal.skins.MinimalTabSkin;
import feathers.controls.ButtonState;
import feathers.controls.TabBar;
import feathers.controls.ToggleButton;
import feathers.controls.ToggleButtonState;
import feathers.layout.HorizontalLayout;
import feathers.style.Theme;
import feathers.utils.DeviceUtil;

/**
	Initialize "minimal" styles for the `TabBar` component.

	@since 1.0.0
**/
@:dox(hide)
@:access(com.feathersui.themes.minimal.BaseMinimalTheme)
class MinimalTabBarStyles {
	public static function initialize(?theme:BaseMinimalTheme):Void {
		if (theme == null) {
			theme = Std.downcast(Theme.fallbackTheme, BaseMinimalTheme);
		}
		if (theme == null) {
			return;
		}
		var styleProvider = theme.styleProvider;
		if (styleProvider.getStyleFunction(TabBar, null) == null) {
			styleProvider.setStyleFunction(TabBar, null, function(tabBar:TabBar):Void {
				var isDesktop = DeviceUtil.isDesktop();
				if (tabBar.backgroundSkin == null) {
					var backgroundSkin = theme.getBackSkin();
					if (isDesktop) {
						backgroundSkin.width = 16.0;
						backgroundSkin.height = 16.0;
					} else {
						backgroundSkin.width = 32.0;
						backgroundSkin.height = 32.0;
					}
					tabBar.backgroundSkin = backgroundSkin;
				}
				if (tabBar.focusRectSkin == null) {
					var focusRectSkin = theme.getFocusRectSkin();
					tabBar.focusRectSkin = focusRectSkin;
				}
				if (tabBar.layout == null) {
					var layout = new HorizontalLayout();
					if (!isDesktop) {
						layout.horizontalAlign = CENTER;
					}
					layout.paddingLeft = theme.mediumPadding;
					layout.paddingRight = theme.mediumPadding;
					layout.paddingTop = theme.mediumPadding;
					layout.paddingBottom = 0.0;
					layout.gap = theme.smallPadding;
					tabBar.layout = layout;
				}
			});
		}

		if (styleProvider.getStyleFunction(ToggleButton, TabBar.CHILD_VARIANT_TAB) == null) {
			styleProvider.setStyleFunction(ToggleButton, TabBar.CHILD_VARIANT_TAB, function(button:ToggleButton):Void {
				var isDesktop = DeviceUtil.isDesktop();
				if (button.backgroundSkin == null) {
					var backgroundSkin = new MinimalTabSkin();
					backgroundSkin.fill = SolidColor(0xff00ff, 0.0); // for hit tests
					backgroundSkin.selectedFill = SolidColor(theme.buttonFaceColor);
					backgroundSkin.setFillForState(ButtonState.DOWN, SolidColor(theme.buttonDownColor));
					backgroundSkin.setFillForState(ToggleButtonState.DOWN(false), SolidColor(theme.buttonDownColor));
					backgroundSkin.cornerRadius = 3.0;
					backgroundSkin.cornerRadiusPosition = TOP;
					backgroundSkin.border = None;
					if (isDesktop) {
						backgroundSkin.width = 100.0;
						backgroundSkin.height = 16.0;
					} else {
						backgroundSkin.width = 120.0;
						backgroundSkin.height = 32.0;
					}
					button.backgroundSkin = backgroundSkin;
				}
				if (button.focusRectSkin == null) {
					var focusRectSkin = theme.getFocusRectSkin();
					button.focusRectSkin = focusRectSkin;
				}
				button.setFocusPadding(theme.mediumPadding);
				if (button.textFormat == null) {
					button.textFormat = theme.getTextFormat();
				}
				if (button.disabledTextFormat == null) {
					button.disabledTextFormat = theme.getDisabledTextFormat();
				}
				button.embedFonts = theme.embedFonts;
				button.paddingLeft = theme.mediumPadding;
				button.paddingRight = theme.mediumPadding;
				button.gap = theme.mediumPadding;
			});
		}
	}
}
