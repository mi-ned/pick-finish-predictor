import 'package:flutter/material.dart';
import 'package:pick_finish_predictor_ui/i18n/app_strings.dart';
import 'package:pick_finish_predictor_ui/models/help_accordion_item_model.dart';
import 'package:pick_finish_predictor_ui/theme/app_colours.dart';
import 'package:pick_finish_predictor_ui/viewmodels/help_view_model.dart';
import 'package:pick_finish_predictor_ui/views/layouts/app_style.dart';
import 'package:pick_finish_predictor_ui/widgets/search_bar_highlighted_text.dart';

class HelpContentSheet extends StatefulWidget {
  final AppStrings strings;
  final AppStyle style;

  const HelpContentSheet({
    super.key,
    required this.strings,
    required this.style,
  });

  @override
  State<HelpContentSheet> createState() => _HelpContentSheetState();
}

class _HelpContentSheetState extends State<HelpContentSheet> {
  final TextEditingController _searchBarController = TextEditingController();
  late final HelpViewModel _helpViewModel;

  @override
  void initState() {
    super.initState();
    _helpViewModel = HelpViewModel(widget.strings);
    _helpViewModel.addListener(_onViewModelChanged);
    _searchBarController.addListener(_onSearchInputChanged);
  }

  void _onViewModelChanged() {
    setState(() {});
  }

  void _onSearchInputChanged() {
    _helpViewModel.updateSearchQuery(_searchBarController.text);
  }

  @override
  void dispose() {
    _helpViewModel.removeListener(_onViewModelChanged);
    _helpViewModel.dispose();
    _searchBarController.removeListener(_onSearchInputChanged);
    _searchBarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(
          widget.style.helpContentSheetVerticalBorderRadius,
        ),
      ),
      child: _buildSheetContainer(),
    );
  }

  Widget _buildSheetContainer() {
    return Container(
      padding: EdgeInsets.fromLTRB(
        widget.style.helpContentSheetHorizontalMargin,
        widget.style.helpContentSheetVerticalTopMargin,
        widget.style.helpContentSheetHorizontalMargin,
        widget.style.helpContentSheetVerticalBottomMargin,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColours.secondaryBackgroundLight,
            AppColours.secondaryBackgroundDark,
          ],
        ),
      ),
      child: SafeArea(
        top: true,
        bottom: false,
        child: _buildContents(),
      ),
    );
  }

  Widget _buildContents() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildHeader(),
        SizedBox(height: widget.style.helpContentSheetTitleSpacing),
        _buildAccordionList(),
        SizedBox(height: widget.style.helpContentSheetSearchBarSpacing),
        _buildSearchBar(),
        SizedBox(height: widget.style.helpContentSheetHandlePillSpacing),
        _buildDragHandle(),
      ],
    );
  }

  Widget _buildHeader() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Text(
          widget.strings.headerHelp,
          style: TextStyle(
            fontSize: widget.style.helpContentSheetTitleFontSize,
            fontWeight: FontWeight.bold,
            color: AppColours.helpExpansiontilePrimaryForeground,
            fontFamily: 'Helvetica Neue',
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            icon: const Icon(
              Icons.close,
              color: AppColours.helpExpansiontilePrimaryForeground,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      controller: _searchBarController,
      style: const TextStyle(
        color: AppColours.helpExpansionTileSearchBarForegroundMain,
      ),
      decoration: InputDecoration(
        hintText: widget.strings.textfieldSearch,
        hintStyle: TextStyle(
          color: AppColours.helpExpansionTileSearchBarForegroundHint,
          fontFamily: 'Verdana',
          fontSize: widget.style.helpContentSheetSearchBarFontSize,
        ),
        prefixIcon: Icon(
          Icons.search,
          color: AppColours.helpExpansionTileSearchBarForegroundHint,
          size: widget.style.helpContentSearchBarIconSize,
        ),
        suffixIcon: _searchBarController.text.isNotEmpty
            ? IconButton(
                icon: Icon(
                  Icons.clear,
                  color: AppColours.helpExpansiontilePrimaryForeground,
                  size: widget.style.helpContentSheetSearchBarSuffixIconSize,
                ),
                onPressed: () => _searchBarController.clear(),
              )
            : null,
        filled: true,
        fillColor: AppColours.helpExpansionTileSearchBarBackground,
        contentPadding: EdgeInsets.symmetric(
          vertical:
              widget.style.helpContentSheetSearchBarVerticalContentPadding,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            widget.style.helpContentSheetVerticalBorderRadius,
          ),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildAccordionList() {
    final items = _helpViewModel.filteredItems;

    return Expanded(
      child: items.isEmpty
          ? Center(
              child: Text(
                widget.strings.noTextFound,
                style: TextStyle(
                  color: AppColours.helpExpansionTileSearchBarForegroundMain,
                  fontSize: widget.style.helpContentSheetAccordianBodyFontSize,
                ),
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return _buildAccordionItem(item: items[index]);
              },
            ),
    );
  }

  Widget _buildAccordionItem({required HelpAccordionItemModel item}) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColours.helpExpansionTileDividerBackground,
            width: widget.style.helpExpansionTileDividerHeight,
          ),
        ),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          key: ValueKey(item.title),
          iconColor: AppColours.helpExpansionTileTrailingIconBackgroundNormal,
          collapsedIconColor:
              AppColours.helpExpansionTileTrailingIconBackgroundCollapsed,
          title: SearchBarHighlightedText(
            text: item.title,
            searchQuery: _helpViewModel.searchQuery,
            textStyle: TextStyle(
              color: AppColours.helpExpansiontilePrimaryForeground,
              fontSize: widget.style.helpContentSheetTileTitleFontSize,
              fontWeight: FontWeight.w500,
              fontFamily: 'Verdana',
            ),
            highlightBackgroundColor:
                AppColours.helpExpansionTileSearchBarHighlightedBackground,
            highlightForegroundColor:
                AppColours.helpExpansionTileSearchBarHighlightedForeground,
          ),
          children: [
            Padding(
              padding: EdgeInsets.only(
                left:
                    widget.style.helpContentSheetAccordianBodyHorizontalMargin,
                right:
                    widget.style.helpContentSheetAccordianBodyHorizontalMargin,
                bottom:
                    widget.style.helpContentSheetAccordianBodyVerticalMargin,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: SearchBarHighlightedText(
                  text: item.description,
                  searchQuery: _helpViewModel.searchQuery,
                  textStyle: TextStyle(
                    color: AppColours.helpExpansionTileOpenForeground,
                    fontSize:
                        widget.style.helpContentSheetAccordianBodyFontSize,
                  ),
                  highlightBackgroundColor:
                      AppColours.helpExpansionTileSearchBarHighlightedBackground,
                  highlightForegroundColor:
                      AppColours.helpExpansionTileSearchBarHighlightedForeground,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDragHandle() {
    return Center(
      child: Container(
        width: widget.style.helpContentSheetPillHandleWidth,
        height: widget.style.helpContentSheetPillHandleHeight,
        decoration: BoxDecoration(
          color: AppColours.helpExpansionPillHandle,
          borderRadius: BorderRadius.circular(2.5),
        ),
      ),
    );
  }
}