/*
	feathersui-minimal-theme
	Copyright 2024 Bowler Hat LLC. All Rights Reserved.

	This program is free software. You can redistribute and/or modify it in
	accordance with the terms of the accompanying license agreement.
 */

package com.feathersui.themes.minimal.components;

import feathers.skins.MultiSkin;
import feathers.controls.FormItem;
import feathers.style.Theme;
import openfl.display.Shape;

/**
	Initialize "minimal" styles for the `FormItem` component.

	@since 1.0.0
**/
@:dox(hide)
@:access(com.feathersui.themes.minimal.BaseMinimalTheme)
class MinimalFormItemStyles {
	public static function initialize(?theme:BaseMinimalTheme):Void {
		if (theme == null) {
			theme = Std.downcast(Theme.fallbackTheme, BaseMinimalTheme);
		}
		if (theme == null) {
			return;
		}
		var styleProvider = theme.styleProvider;
		if (styleProvider.getStyleFunction(FormItem, null) == null) {
			styleProvider.setStyleFunction(FormItem, null, function(formItem:FormItem):Void {
				if (formItem.requiredSkin == null) {
					var requiredSkin = new MultiSkin();

					var defaultIcon = new Shape();
					drawRequiredIcon(defaultIcon, theme.dangerTextColor);
					requiredSkin.defaultView = defaultIcon;

					var disabledIcon = new Shape();
					drawRequiredIcon(disabledIcon, theme.labelTextDisabledColor);
					requiredSkin.disabledView = disabledIcon;

					formItem.requiredSkin = requiredSkin;
				}

				if (formItem.textFormat == null) {
					formItem.textFormat = theme.getTextFormat();
				}
				if (formItem.disabledTextFormat == null) {
					formItem.disabledTextFormat = theme.getDisabledTextFormat();
				}

				formItem.gap = theme.smallPadding;
			});
		}
	}

	private static function drawRequiredIcon(icon:Shape, color:UInt):Void {
		icon.graphics.lineStyle(1.0, color);
		icon.graphics.moveTo(3.0, 0.5);
		icon.graphics.lineTo(3.0, 4.5);

		icon.graphics.moveTo(1.0, 1.5);
		icon.graphics.lineTo(5.0, 3.5);
		icon.graphics.moveTo(1.0, 3.5);
		icon.graphics.lineTo(5.0, 1.5);

		icon.graphics.lineStyle();
		icon.graphics.beginFill(0xff00ff, 0.0);
		icon.graphics.drawRect(0.0, 0.0, 6.0, 5.0);
		icon.graphics.endFill();
	}
}
