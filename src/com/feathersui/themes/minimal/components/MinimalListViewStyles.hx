/*
	feathersui-minimal-theme
	Copyright 2024 Bowler Hat LLC. All Rights Reserved.

	This program is free software. You can redistribute and/or modify it in
	accordance with the terms of the accompanying license agreement.
 */

package com.feathersui.themes.minimal.components;

import com.feathersui.themes.minimal.skins.MinimalRectangleSkin;
import feathers.controls.ListView;
import feathers.layout.VerticalListLayout;
import feathers.style.Theme;
import feathers.utils.DeviceUtil;

/**
	Initialize "minimal" styles for the `ListView` component.
**/
@:dox(hide)
@:access(com.feathersui.themes.minimal.BaseMinimalTheme)
class MinimalListViewStyles {
	public static function initialize(?theme:BaseMinimalTheme):Void {
		if (theme == null) {
			theme = Std.downcast(Theme.fallbackTheme, BaseMinimalTheme);
		}
		if (theme == null) {
			return;
		}
		var styleProvider = theme.styleProvider;
		function setDefaultStyles(listView:ListView):Void {
			var isDesktop = DeviceUtil.isDesktop();
			listView.autoHideScrollBars = !isDesktop;
			listView.fixedScrollBars = isDesktop;
			if (listView.layout == null) {
				var layout = new VerticalListLayout();
				layout.requestedRowCount = 5.0;
				listView.layout = layout;
			}
			if (listView.focusRectSkin == null) {
				var focusRectSkin = theme.getFocusRectSkin();
				listView.focusRectSkin = focusRectSkin;
			}
			listView.setFocusPadding(2.0);
			listView.filters = [theme.getShadow(2.0, true)];
		}
		function styleListViewWithBorderVariant(listView:ListView):Void {
			if (listView.backgroundSkin == null) {
				var backgroundSkin = new MinimalRectangleSkin();
				backgroundSkin.border = SolidColor(1.0, 0x000000, 0.1);
				backgroundSkin.fill = SolidColor(theme.listDefaultColor);
				backgroundSkin.width = 100.0;
				backgroundSkin.height = 16.0;
				listView.backgroundSkin = backgroundSkin;
			}
			listView.setPadding(1.0);
			setDefaultStyles(listView);
		}
		function styleListViewWithBorderlessVariant(listView:ListView):Void {
			if (listView.backgroundSkin == null) {
				var backgroundSkin = new MinimalRectangleSkin();
				backgroundSkin.border = None;
				backgroundSkin.fill = SolidColor(theme.listDefaultColor);
				backgroundSkin.width = 100.0;
				backgroundSkin.height = 16.0;
				listView.backgroundSkin = backgroundSkin;
			}
			setDefaultStyles(listView);
		}
		if (styleProvider.getStyleFunction(ListView, ListView.VARIANT_BORDER) == null) {
			styleProvider.setStyleFunction(ListView, ListView.VARIANT_BORDER, styleListViewWithBorderVariant);
		}
		if (styleProvider.getStyleFunction(ListView, ListView.VARIANT_BORDERLESS) == null) {
			styleProvider.setStyleFunction(ListView, ListView.VARIANT_BORDERLESS, styleListViewWithBorderlessVariant);
		}
		if (styleProvider.getStyleFunction(ListView, ListView.VARIANT_POP_UP) == null) {
			styleProvider.setStyleFunction(ListView, ListView.VARIANT_POP_UP, function(listView:ListView):Void {
				if (listView.layout == null) {
					var layout = new VerticalListLayout();
					layout.requestedMinRowCount = 1.0;
					layout.requestedMaxRowCount = 5.0;
					listView.layout = layout;
				}
				if (listView.backgroundSkin == null) {
					var backgroundSkin = new MinimalRectangleSkin();
					backgroundSkin.border = SolidColor(1.0, theme.backgroundColor);
					backgroundSkin.fill = SolidColor(theme.listDefaultColor);
					backgroundSkin.width = 100.0;
					backgroundSkin.height = 16.0;
					listView.backgroundSkin = backgroundSkin;
				}
				listView.setPadding(1.0);
				listView.filters = [theme.getShadow(2.0)];
			});
		}
		if (styleProvider.getStyleFunction(ListView, null) == null) {
			styleProvider.setStyleFunction(ListView, null, function(listView:ListView):Void {
				var isDesktop = DeviceUtil.isDesktop();
				if (isDesktop) {
					styleListViewWithBorderVariant(listView);
				} else {
					styleListViewWithBorderlessVariant(listView);
				}
			});
		}
	}
}
