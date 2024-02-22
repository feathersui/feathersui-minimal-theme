/*
	feathersui-minimal-theme
	Copyright 2024 Bowler Hat LLC. All Rights Reserved.

	This program is free software. You can redistribute and/or modify it in
	accordance with the terms of the accompanying license agreement.
 */

package com.feathersui.themes.minimal.components;

import com.feathersui.themes.minimal.skins.MinimalRectangleSkin;
import feathers.controls.GroupListView;
import feathers.controls.dataRenderers.ItemRenderer;
import feathers.layout.VerticalListLayout;
import feathers.style.Theme;
import feathers.utils.DeviceUtil;

/**
	Initialize "minimal" styles for the `GroupListView` component.
**/
@:dox(hide)
@:access(com.feathersui.themes.minimal.BaseMinimalTheme)
class MinimalGroupListViewStyles {
	public static function initialize(?theme:BaseMinimalTheme):Void {
		if (theme == null) {
			theme = Std.downcast(Theme.fallbackTheme, BaseMinimalTheme);
		}
		if (theme == null) {
			return;
		}
		var styleProvider = theme.styleProvider;
		function setDefaultStyles(listView:GroupListView):Void {
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
		function styleGroupListViewWithBorderVariant(listView:GroupListView):Void {
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
		function styleGroupListViewWithBorderlessVariant(listView:GroupListView):Void {
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
		if (styleProvider.getStyleFunction(GroupListView, GroupListView.VARIANT_BORDER) == null) {
			styleProvider.setStyleFunction(GroupListView, GroupListView.VARIANT_BORDER, styleGroupListViewWithBorderVariant);
		}
		if (styleProvider.getStyleFunction(GroupListView, GroupListView.VARIANT_BORDERLESS) == null) {
			styleProvider.setStyleFunction(GroupListView, GroupListView.VARIANT_BORDERLESS, styleGroupListViewWithBorderlessVariant);
		}
		if (styleProvider.getStyleFunction(GroupListView, null) == null) {
			styleProvider.setStyleFunction(GroupListView, null, function(listView:GroupListView):Void {
				var isDesktop = DeviceUtil.isDesktop();
				if (isDesktop) {
					styleGroupListViewWithBorderVariant(listView);
				} else {
					styleGroupListViewWithBorderlessVariant(listView);
				}
			});
		}
		if (styleProvider.getStyleFunction(ItemRenderer, GroupListView.CHILD_VARIANT_HEADER_RENDERER) == null) {
			styleProvider.setStyleFunction(ItemRenderer, GroupListView.CHILD_VARIANT_HEADER_RENDERER, function(itemRenderer:ItemRenderer):Void {
				if (itemRenderer.backgroundSkin == null) {
					var backgroundSkin = new MinimalRectangleSkin();
					backgroundSkin.border = None;
					backgroundSkin.fill = SolidColor(theme.listHeadingColor);
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
				itemRenderer.embedFonts = theme.embedFonts;
				itemRenderer.horizontalAlign = LEFT;
				itemRenderer.paddingTop = 1.0;
				itemRenderer.paddingBottom = 1.0;
				itemRenderer.paddingLeft = 5.0;
				itemRenderer.paddingRight = 5.0;
				itemRenderer.gap = 2.0;
			});
		}
	}
}
