/*
	feathersui-minimal-theme
	Copyright 2024 Bowler Hat LLC. All Rights Reserved.

	This program is free software. You can redistribute and/or modify it in
	accordance with the terms of the accompanying license agreement.
 */

package com.feathersui.themes.minimal.components;

import feathers.controls.Button;
import feathers.controls.ListView;
import feathers.controls.PopUpListView;
import feathers.skins.MultiSkin;
import feathers.style.Theme;
import openfl.display.Shape;

/**
	Initialize "minimal" styles for the `PopUpListView` component.
**/
@:dox(hide)
@:access(com.feathersui.themes.minimal.BaseMinimalTheme)
class MinimalPopUpListViewStyles {
	public static function initialize(?theme:BaseMinimalTheme):Void {
		if (theme == null) {
			theme = Std.downcast(Theme.fallbackTheme, BaseMinimalTheme);
		}
		if (theme == null) {
			return;
		}
		var styleProvider = theme.styleProvider;
		if (styleProvider.getStyleFunction(Button, PopUpListView.CHILD_VARIANT_BUTTON) == null) {
			styleProvider.setStyleFunction(Button, PopUpListView.CHILD_VARIANT_BUTTON, function(button:Button):Void {
				styleProvider.getStyleFunction(Button, null)(button);
				button.horizontalAlign = LEFT;
				button.iconPosition = RIGHT;
				button.gap = Math.POSITIVE_INFINITY;
				if (button.icon == null) {
					var icon = new MultiSkin();

					var defaultIcon = new Shape();
					drawArrowIcon(defaultIcon, theme.labelTextColor, theme.backgroundColor);
					icon.defaultView = defaultIcon;

					var disabledIcon = new Shape();
					drawArrowIcon(disabledIcon, theme.labelTextDisabledColor, theme.backgroundColor);
					icon.disabledView = disabledIcon;

					button.icon = icon;
				}
			});
		}
		if (styleProvider.getStyleFunction(ListView, PopUpListView.CHILD_VARIANT_LIST_VIEW) == null) {
			styleProvider.setStyleFunction(ListView, PopUpListView.CHILD_VARIANT_LIST_VIEW, function(listView:ListView):Void {
				styleProvider.getStyleFunction(ListView, ListView.VARIANT_POP_UP)(listView);
			});
		}
	}

	private static function drawArrowIcon(icon:Shape, iconColor:UInt, backgroundColor:UInt):Void {
		icon.graphics.beginFill(0xff00ff, 0.0);
		icon.graphics.drawRect(0.0, 0.0, 18.0, 18.0);
		icon.graphics.endFill();
		icon.graphics.beginFill(iconColor);
		icon.graphics.drawRect(9.0, 7.0, 1.0, 5.0);
		icon.graphics.drawRect(7.0, 9.0, 5.0, 1.0);
		icon.graphics.endFill();
		icon.graphics.beginFill(backgroundColor);
		icon.graphics.drawRect(0.0, 0.0, 1.0, 18.0);
		icon.graphics.endFill();
	}
}
