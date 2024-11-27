import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/sources/view/widgets/sources_tabs.dart';
import 'package:news/shared/widgets/error_indicator.dart';
import 'package:news/shared/widgets/loading_indicator.dart';
import 'package:news/sources/view_model/sources_states.dart';
import 'package:news/sources/view_model/sources_view_model.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails(
    this.categoryId, {
    super.key,
  });

  final String categoryId;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  final viewModel = SourcesViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.getSources(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => viewModel,
      child: BlocBuilder<SourcesViewModel, SourcesState>(
        builder: (_, state) {
          if (state is GetSourcesLoading) {
            return const LoadingIndicator();
          } else if (state is GetSourcesError) {
            return ErrorIndicator(state.message);
          } else if (state is GetSourcesSuccess) {
            return SourcesTabs(state.sources);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
