/*
	feathersui-minimal-theme
	Copyright 2024 Bowler Hat LLC. All Rights Reserved.

	This program is free software. You can redistribute and/or modify it in
	accordance with the terms of the accompanying license agreement.
 */

package com.feathersui.themes.minimal.components;

import com.feathersui.themes.minimal.skins.MinimalRectangleSkin;
import feathers.controls.Alert;
import feathers.controls.ButtonBar;
import feathers.controls.Label;
import feathers.layout.HorizontalDistributedLayout;
import feathers.layout.HorizontalLayout;
import feathers.layout.HorizontalLayoutData;
import feathers.style.Theme;
import feathers.utils.DeviceUtil;

/**
	Initialize "minimal" styles for the `Alert` component.

	@since 1.0.0
**/
@:dox(hide)
@:access(com.feathersui.themes.minimal.BaseMinimalTheme)
class MinimalAlertStyles {
	public static function initialize(?theme:BaseMinimalTheme):Void {
		if (theme == null) {
			theme = Std.downcast(Theme.fallbackTheme, BaseMinimalTheme);
		}
		if (theme == null) {
			return;
		}
		var styleProvider = theme.styleProvider;
		if (styleProvider.getStyleFunction(Alert, null) == null) {
			styleProvider.setStyleFunction(Alert, null, function(alert:Alert):Void {
				var isDesktop = DeviceUtil.isDesktop();
				alert.autoHideScrollBars = !isDesktop;
				alert.fixedScrollBars = isDesktop;
				if (alert.backgroundSkin == null) {
					var backgroundSkin = new MinimalRectangleSkin();
					backgroundSkin.fill = SolidColor(theme.containerColor);
					backgroundSkin.border = SolidColor(1.0, theme.backgroundColor);
					backgroundSkin.maxWidth = 276.0;
					alert.backgroundSkin = backgroundSkin;
				}
				if (alert.layout == null) {
					var layout = new HorizontalLayout();
					layout.paddingTop = 4.0;
					layout.paddingRight = 4.0;
					layout.paddingBottom = 4.0;
					layout.paddingLeft = 4.0;
					layout.gap = 2.0;
					layout.percentWidthResetEnabled = true;
					alert.layout = layout;
				}
				alert.setPadding(1.0);
			});
		}
		if (styleProvider.getStyleFunction(ButtonBar, Alert.CHILD_VARIANT_BUTTON_BAR) == null) {
			styleProvider.setStyleFunction(ButtonBar, Alert.CHILD_VARIANT_BUTTON_BAR, function(buttonBar:ButtonBar):Void {
				if (buttonBar.layout == null) {
					var layout = new HorizontalDistributedLayout();
					layout.paddingTop = 4.0;
					layout.paddingRight = 4.0;
					layout.paddingBottom = 4.0;
					layout.paddingLeft = 4.0;
					layout.gap = 2.0;
					buttonBar.layout = layout;
				}
			});
		}
		if (styleProvider.getStyleFunction(Label, Alert.CHILD_VARIANT_MESSAGE_LABEL) == null) {
			styleProvider.setStyleFunction(Label, Alert.CHILD_VARIANT_MESSAGE_LABEL, function(label:Label):Void {
				if (label.textFormat == null) {
					label.textFormat = theme.getTextFormat();
				}
				if (label.disabledTextFormat == null) {
					label.disabledTextFormat = theme.getDisabledTextFormat();
				}
				if (label.layoutData == null) {
					label.layoutData = HorizontalLayoutData.fillHorizontal();
				}
				label.wordWrap = true;
			});
		}
	}
}
