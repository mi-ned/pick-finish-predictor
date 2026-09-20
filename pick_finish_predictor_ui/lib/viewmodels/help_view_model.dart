import 'package:flutter/material.dart';
import 'package:pick_finish_predictor_ui/i18n/app_strings.dart';
import 'package:pick_finish_predictor_ui/models/help_accordion_item_model.dart';

class HelpViewModel extends ChangeNotifier {
  final List<HelpAccordionItemModel> _allItems;
  List<HelpAccordionItemModel> _filteredItems = [];
  String _searchQuery = '';

  List<HelpAccordionItemModel> get filteredItems => List.unmodifiable(_filteredItems);
  String get searchQuery => _searchQuery;

  HelpViewModel(AppStrings strings) : _allItems = _loadAllHelpItems(strings) {
    _filteredItems = List.from(_allItems);
  }

  static List<HelpAccordionItemModel> _loadAllHelpItems(AppStrings strings) {
    return [
      HelpAccordionItemModel(
        title: strings.accordianHeaderCurrentTime,
        description: strings.accordianContentCurrentTime,
      ),
      HelpAccordionItemModel(
        title: strings.accordianHeaderItemsRemaining,
        description: strings.accordianContentItemsRemaining,
      ),
      HelpAccordionItemModel(
        title: strings.accordianHeaderNumberOfPickers,
        description: strings.accordianContentNumberOfPickers,
      ),
      HelpAccordionItemModel(
        title: strings.accordianHeaderAveragePickRate,
        description: strings.accordianContentAveragePickRate,
      ),
      HelpAccordionItemModel(
        title: strings.accordianHeaderFormulaBreakdown,
        description: strings.accordianContentFormulaBreakdown,
      ),
      HelpAccordionItemModel(
        title: strings.accordianHeaderClearFields,
        description: strings.accordianContentClearFields,
      ),
      HelpAccordionItemModel(
        title: strings.accordianHeaderStaticMode,
        description: strings.accordianContentStaticMode,
      ),
      HelpAccordionItemModel(
        title: strings.accordianHeaderDynamicMode,
        description: strings.accordianContentDynamicMode,
      ),
      HelpAccordionItemModel(
        title: strings.accordianHeaderNotebook,
        description: strings.accordianContentNotebook,
      ),
      HelpAccordionItemModel(
        title: strings.accordianHeaderHistory,
        description: strings.accordianContentHistory,
      ),
      HelpAccordionItemModel(
        title: strings.accordianHeaderClearHistory,
        description: strings.accordianContentClearHistory,
      ),
    ];
  }

  void updateSearchQuery(String searchQuery) {
    _searchQuery = searchQuery;
    final cleanQuery = searchQuery.trim().toLowerCase();
    if (cleanQuery.isEmpty) {
      _filteredItems = List.from(_allItems);
    } else {
      _filteredItems = _allItems.where((item) {
        final searchQueryTitleMatch = item.title.toLowerCase().contains(cleanQuery);
        final searchQueryDescriptionMatch = item.description.toLowerCase().contains(cleanQuery);
        return searchQueryTitleMatch || searchQueryDescriptionMatch;
      }).toList();
    }
    notifyListeners();
  }
}