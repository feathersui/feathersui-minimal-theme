/*
	feathersui-minimal-theme
	Copyright 2024 Bowler Hat LLC. All Rights Reserved.

	This program is free software. You can redistribute and/or modify it in
	accordance with the terms of the accompanying license agreement.
 */

package com.feathersui.themes.minimal.components;

import com.feathersui.themes.minimal.skins.MinimalRectangleSkin;
import feathers.controls.TreeView;
import feathers.layout.VerticalListLayout;
import feathers.style.Theme;
import feathers.utils.DeviceUtil;

/**
	Initialize "minimal" styles for the `TreeView` component.
**/
@:dox(hide)
@:access(com.feathersui.themes.minimal.BaseMinimalTheme)
class MinimalTreeViewStyles {
	public static function initialize(?theme:BaseMinimalTheme):Void {
		if (theme == null) {
			theme = Std.downcast(Theme.fallbackTheme, BaseMinimalTheme);
		}
		if (theme == null) {
			return;
		}
		var styleProvider = theme.styleProvider;
		function setDefaultStyles(treeView:TreeView):Void {
			var isDesktop = DeviceUtil.isDesktop();
			treeView.autoHideScrollBars = !isDesktop;
			treeView.fixedScrollBars = isDesktop;
			if (treeView.layout == null) {
				var layout = new VerticalListLayout();
				layout.requestedRowCount = 5.0;
				treeView.layout = layout;
			}
			if (treeView.focusRectSkin == null) {
				var focusRectSkin = theme.getFocusRectSkin();
				treeView.focusRectSkin = focusRectSkin;
			}
			treeView.setFocusPadding(2.0);
			treeView.filters = [theme.getShadow(2.0, true)];
		}
		function styleTreeViewWithBorderVariant(treeView:TreeView):Void {
			if (treeView.backgroundSkin == null) {
				var backgroundSkin = new MinimalRectangleSkin();
				backgroundSkin.border = SolidColor(1.0, 0x000000, 0.1);
				backgroundSkin.fill = SolidColor(theme.listDefaultColor);
				backgroundSkin.width = 100.0;
				backgroundSkin.height = 16.0;
				treeView.backgroundSkin = backgroundSkin;
			}
			treeView.setPadding(1.0);
			setDefaultStyles(treeView);
		}
		function styleTreeViewWithBorderlessVariant(treeView:TreeView):Void {
			if (treeView.backgroundSkin == null) {
				var backgroundSkin = new MinimalRectangleSkin();
				backgroundSkin.border = None;
				backgroundSkin.fill = SolidColor(theme.listDefaultColor);
				backgroundSkin.width = 100.0;
				backgroundSkin.height = 16.0;
				treeView.backgroundSkin = backgroundSkin;
			}
			setDefaultStyles(treeView);
		}
		if (styleProvider.getStyleFunction(TreeView, TreeView.VARIANT_BORDER) == null) {
			styleProvider.setStyleFunction(TreeView, TreeView.VARIANT_BORDER, styleTreeViewWithBorderVariant);
		}
		if (styleProvider.getStyleFunction(TreeView, TreeView.VARIANT_BORDERLESS) == null) {
			styleProvider.setStyleFunction(TreeView, TreeView.VARIANT_BORDERLESS, styleTreeViewWithBorderlessVariant);
		}
		if (styleProvider.getStyleFunction(TreeView, null) == null) {
			styleProvider.setStyleFunction(TreeView, null, function(treeView:TreeView):Void {
				var isDesktop = DeviceUtil.isDesktop();
				if (isDesktop) {
					styleTreeViewWithBorderVariant(treeView);
				} else {
					styleTreeViewWithBorderlessVariant(treeView);
				}
			});
		}
	}
}
